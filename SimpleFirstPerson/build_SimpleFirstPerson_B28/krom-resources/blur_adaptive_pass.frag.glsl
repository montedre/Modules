#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform sampler2D gbuffer0;
uniform sampler2D tex;
uniform vec2 dirInv;

in vec2 texCoord;
out vec4 fragColor;

vec2 unpackFloat(float f)
{
    return vec2(floor(f) / 100.0, fract(f));
}

void main()
{
    float roughness = unpackFloat(texture(gbuffer0, texCoord).z).y;
    if (roughness >= 0.800000011920928955078125)
    {
        vec3 _50 = texture(tex, texCoord).xyz;
        fragColor = vec4(_50.x, _50.y, _50.z, fragColor.w);
        return;
    }
    vec3 _63 = texture(tex, texCoord + (dirInv * 2.5)).xyz;
    fragColor = vec4(_63.x, _63.y, _63.z, fragColor.w);
    vec3 _76 = fragColor.xyz + texture(tex, texCoord + (dirInv * 1.5)).xyz;
    fragColor = vec4(_76.x, _76.y, _76.z, fragColor.w);
    vec3 _85 = fragColor.xyz + texture(tex, texCoord).xyz;
    fragColor = vec4(_85.x, _85.y, _85.z, fragColor.w);
    vec3 _97 = fragColor.xyz + texture(tex, texCoord - (dirInv * 1.5)).xyz;
    fragColor = vec4(_97.x, _97.y, _97.z, fragColor.w);
    vec3 _109 = fragColor.xyz + texture(tex, texCoord - (dirInv * 2.5)).xyz;
    fragColor = vec4(_109.x, _109.y, _109.z, fragColor.w);
    vec3 _116 = fragColor.xyz / vec3(5.0);
    fragColor = vec4(_116.x, _116.y, _116.z, fragColor.w);
}

