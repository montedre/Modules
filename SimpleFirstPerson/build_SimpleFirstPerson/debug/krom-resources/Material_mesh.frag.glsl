#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

in vec3 wnormal;
out vec4 fragColor[2];

vec2 octahedronWrap(vec2 v)
{
    return (vec2(1.0) - abs(v.yx)) * vec2((v.x >= 0.0) ? 1.0 : (-1.0), (v.y >= 0.0) ? 1.0 : (-1.0));
}

float packFloat(float f1, float f2)
{
    return floor(f1 * 100.0) + min(f2, 0.9900000095367431640625);
}

float packFloat2(float f1, float f2)
{
    return floor(f1 * 255.0) + min(f2, 0.9900000095367431640625);
}

void main()
{
    vec3 n = normalize(wnormal);
    vec3 basecol = vec3(0.80000007152557373046875, 0.00355222332291305065155029296875, 0.02365767769515514373779296875);
    float roughness = 0.0;
    float metallic = 0.0;
    float occlusion = 1.0;
    float specular = 0.0;
    n /= vec3((abs(n.x) + abs(n.y)) + abs(n.z));
    vec2 _93;
    if (n.z >= 0.0)
    {
        _93 = n.xy;
    }
    else
    {
        _93 = octahedronWrap(n.xy);
    }
    n = vec3(_93.x, _93.y, n.z);
    fragColor[0] = vec4(n.xy, packFloat(metallic, roughness), 1.0 - gl_FragCoord.z);
    fragColor[1] = vec4(basecol, packFloat2(occlusion, specular));
}

