#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

in vec3 wnormal;
out vec4 fragColor[3];
in vec4 wvpposition;
in vec4 prevwvpposition;

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
    vec3 basecol = vec3(0.80000007152557373046875, 0.07901500165462493896484375, 0.075478710234165191650390625);
    float roughness = 0.5;
    float metallic = 1.0;
    float occlusion = 1.0;
    float specular = 0.5;
    n /= vec3((abs(n.x) + abs(n.y)) + abs(n.z));
    vec2 _94;
    if (n.z >= 0.0)
    {
        _94 = n.xy;
    }
    else
    {
        _94 = octahedronWrap(n.xy);
    }
    n = vec3(_94.x, _94.y, n.z);
    fragColor[0] = vec4(n.xy, packFloat(metallic, roughness), 1.0 - gl_FragCoord.z);
    fragColor[1] = vec4(basecol, packFloat2(occlusion, specular));
    vec2 posa = ((wvpposition.xy / vec2(wvpposition.w)) * 0.5) + vec2(0.5);
    vec2 posb = ((prevwvpposition.xy / vec2(prevwvpposition.w)) * 0.5) + vec2(0.5);
    vec2 _167 = vec2(posa - posb);
    fragColor[2] = vec4(_167.x, _167.y, fragColor[2].z, fragColor[2].w);
}

