#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform mat3 N;
uniform mat4 WVP;
uniform mat4 prevWVP;

in vec3 pos;
out vec3 wnormal;
in vec3 nor;
out vec4 wvpposition;
out vec4 prevwvpposition;

void main()
{
    vec4 spos = vec4(pos, 1.0);
    wnormal = normalize(N * nor);
    gl_Position = WVP * spos;
    wvpposition = gl_Position;
    prevwvpposition = prevWVP * spos;
}

