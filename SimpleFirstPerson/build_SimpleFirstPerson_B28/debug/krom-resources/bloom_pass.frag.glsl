#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform sampler2D tex;

in vec2 texCoord;
out vec4 fragColor;

void main()
{
    vec4 col = texture(tex, texCoord);
    float brightness = dot(col.xyz, vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875));
    if (brightness > 1.0)
    {
        fragColor = vec4(col.xyz.x, col.xyz.y, col.xyz.z, fragColor.w);
        return;
    }
    fragColor = vec4(vec3(0.0).x, vec3(0.0).y, vec3(0.0).z, fragColor.w);
}

