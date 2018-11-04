#version 450
#define _VoxelAOvar

#include "compiled.inc"

#ifdef _IndPos
	uniform mat4 invVP;
	uniform vec3 eye;
#endif

in vec2 pos;

out vec2 texCoord;
#ifdef _IndPos
	out vec3 viewRay;
#endif

void main() {
	// Scale vertex attribute to [0-1] range
	const vec2 madd = vec2(0.5, 0.5);
	texCoord = pos.xy * madd + madd;
	#ifdef _InvY
	texCoord.y = 1.0 - texCoord.y;
	#endif

	gl_Position = vec4(pos.xy, 0.0, 1.0);

#ifdef _IndPos
	// NDC (at the back of cube)
	vec4 v = vec4(pos.x, pos.y, 1.0, 1.0);	
	v = vec4(invVP * v);
	v.xyz /= v.w;
	viewRay = v.xyz - eye;
#endif
}