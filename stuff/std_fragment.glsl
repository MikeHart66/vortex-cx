#ifdef GL_ES
precision highp int;
precision mediump float;
#endif

uniform int baseTexMode;
uniform bool useNormalTex;
uniform bool useReflectTex;
uniform bool useRefractTex;
uniform sampler2D baseTexSampler;
uniform samplerCube baseCubeSampler;
uniform sampler2D normalTexSampler;
uniform samplerCube reflectCubeSampler;
uniform samplerCube refractCubeSampler;
uniform bool usePixelLighting;
uniform bool lightingEnabled;
uniform bool lightEnabled[MAX_LIGHTS];
uniform vec4 lightPos[MAX_LIGHTS];	// In viewer space !!!
uniform vec3 lightColor[MAX_LIGHTS];
uniform float lightAttenuation[MAX_LIGHTS];
uniform vec3 ambient;
uniform int shininess;
uniform bool fogEnabled;
uniform vec3 fogColor;
varying vec3 fpos;
varying vec3 fposNorm;
varying vec3 fnormal;
varying vec4 fcolor;
varying vec2 ftex;
varying vec3 fcombinedSpecular;
varying float fogFactor;
varying vec3 fcubeCoords;
varying vec3 freflectCoords;
varying vec3 frefractCoords;
varying mat3 tbnMatrix;

vec4 combinedColor;
vec3 combinedSpecular;

void CalcLighting(vec3 V, vec3 NV, vec3 N) {
	// Color that combines diffuse component of all lights
	combinedColor = vec4(ambient, 1.0);
	
	// Get vertex normal or compute from normal map
	vec3 normal = N;
	if ( useNormalTex ) {
		vec3 normalTexColor = vec3(texture2D(normalTexSampler, ftex));
		normal = tbnMatrix * (normalTexColor*2.0 - 1.0);
	}

	// Compute all lights
	for ( int i = 0; i < MAX_LIGHTS; i++ ) {
		if ( lightEnabled[i] ) {
			vec3 L = vec3(lightPos[i]);
			float att = 1.0;

			// Point light
			if ( lightPos[i].w == 1.0 ) {
				L -= V;
				att = 1.0 / (1.0 + lightAttenuation[i]*length(L));
			}

			L = normalize(L);
			float NdotL = max(dot(normal, L), 0.0);

			// Diffuse
			combinedColor += NdotL * vec4(lightColor[i], 1.0) * att;

			// Specular
			if ( shininess > 0 && NdotL > 0.0 ) {
				vec3 H = normalize(L - NV);
				float NdotH = max(dot(normal, H), 0.0);
				combinedSpecular += pow(NdotH, float(shininess)) * att;
			}
		}
	}
	
	combinedColor = clamp(combinedColor, 0.0, 1.0);
}

void main() {
	// Lighting
	if ( lightingEnabled && (usePixelLighting || useNormalTex) ) {
		CalcLighting(fpos, fposNorm, fnormal);
		combinedColor *= fcolor;
	} else {
		combinedColor = fcolor;
	}

	// Base texture
	if ( baseTexMode == 1 ) combinedColor *= texture2D(baseTexSampler, ftex);
	else if ( baseTexMode == 2 ) combinedColor *= textureCube(baseCubeSampler, fcubeCoords);

	// Reject fragment with low alpha
	if ( combinedColor.a <= 0.004 ) discard;
	
	// Reflection texture
	if ( useReflectTex ) {
		combinedColor *= textureCube(reflectCubeSampler, freflectCoords);
	}

	// Refraction texture
	if ( useRefractTex ) {
		combinedColor *= textureCube(refractCubeSampler, frefractCoords);
	}

	// Add specular
	if ( lightingEnabled ) {
		if ( usePixelLighting || useNormalTex ) combinedColor += vec4(combinedSpecular, 0.0);
		else combinedColor += vec4(fcombinedSpecular, 0.0);
		combinedColor = clamp(combinedColor, 0.0, 1.0);
	}
	
	// Add fog
	if ( fogEnabled ) combinedColor = vec4(mix(fogColor, vec3(combinedColor), fogFactor), combinedColor.a);
	
	// Set final color
	gl_FragColor = combinedColor;
}
