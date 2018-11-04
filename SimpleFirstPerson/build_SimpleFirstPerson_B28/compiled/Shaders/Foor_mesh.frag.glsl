#version 450
#define _Irr
#define _EnvCol
#define _Deferred
#define _CSM
#define _RTGI
#define _VoxelCones5
#define _VoxelAOvar
#define _IndPos
#define _SMAA
#define _Veloc
#define _SSAO
#define _gbuffer2
#include "compiled.inc"
#include "std/gbuffer.glsl"
in vec3 wnormal;
in vec4 wvpposition;
in vec4 prevwvpposition;
out vec4[3] fragColor;
void main() {
vec3 n = normalize(wnormal);
	vec3 basecol;
	float roughness;
	float metallic;
	float occlusion;
	float specular;
	basecol = vec3(0.8000000715255737, 0.07901500165462494, 0.07547871023416519);
	roughness = 0.5;
	metallic = 1.0;
	occlusion = 1.0;
	specular = 0.5;
	n /= (abs(n.x) + abs(n.y) + abs(n.z));
	n.xy = n.z >= 0.0 ? n.xy : octahedronWrap(n.xy);
	fragColor[0] = vec4(n.xy, packFloat(metallic, roughness), 1.0 - gl_FragCoord.z);
	fragColor[1] = vec4(basecol.rgb, packFloat2(occlusion, specular));
	vec2 posa = (wvpposition.xy / wvpposition.w) * 0.5 + 0.5;
	vec2 posb = (prevwvpposition.xy / prevwvpposition.w) * 0.5 + 0.5;
	fragColor[2].rg = vec2(posa - posb);
}
