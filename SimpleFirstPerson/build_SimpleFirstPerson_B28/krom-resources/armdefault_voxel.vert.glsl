#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform mat4 W;

out vec3 voxpositionGeom;
in vec3 pos;
in vec3 nor;

void main()
{
    voxpositionGeom = vec3((W * vec4(pos, 1.0)).xyz) / vec3(8.0);
}

