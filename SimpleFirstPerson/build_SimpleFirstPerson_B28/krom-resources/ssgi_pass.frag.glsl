#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform mat4 P;
uniform sampler2D gbufferD;
uniform vec2 cameraProj;
uniform sampler2D gbuffer1;
uniform sampler2D gbuffer0;
uniform mat4 tiV;

in vec3 viewRay;
in vec2 texCoord;
out vec4 fragColor;
float occ;
vec3 col;
vec2 coord;
float depth;
vec3 hitCoord;
vec3 vpos;

vec3 _215;

vec2 octahedronWrap(vec2 v)
{
    return (vec2(1.0) - abs(v.yx)) * vec2((v.x >= 0.0) ? 1.0 : (-1.0), (v.y >= 0.0) ? 1.0 : (-1.0));
}

vec3 getPosView(vec3 viewRay_1, float depth_1, vec2 cameraProj_1)
{
    float linearDepth = cameraProj_1.y / (cameraProj_1.x - depth_1);
    return viewRay_1 * linearDepth;
}

vec2 getProjectedCoord(vec3 hitCoord_1)
{
    vec4 projectedCoord = P * vec4(hitCoord_1, 1.0);
    vec2 _91 = projectedCoord.xy / vec2(projectedCoord.w);
    projectedCoord = vec4(_91.x, _91.y, projectedCoord.z, projectedCoord.w);
    vec2 _99 = (projectedCoord.xy * 0.5) + vec2(0.5);
    projectedCoord = vec4(_99.x, _99.y, projectedCoord.z, projectedCoord.w);
    return projectedCoord.xy;
}

float getDeltaDepth(vec3 hitCoord_1)
{
    vec3 param = hitCoord_1;
    coord = getProjectedCoord(param);
    depth = (texture(gbufferD, coord).x * 2.0) - 1.0;
    vec3 p = getPosView(viewRay, depth, cameraProj);
    return p.z - hitCoord_1.z;
}

void rayCast(inout vec3 dir)
{
    hitCoord = vpos;
    dir *= 0.00999999977648258209228515625;
    float dist = 0.20000000298023223876953125;
    for (int i = 0; i < 8; i++)
    {
        hitCoord += dir;
        vec3 param = hitCoord;
        float _166 = getDeltaDepth(param);
        float delta = _166;
        if ((delta > 0.0) && (delta < 0.20000000298023223876953125))
        {
            dist = distance(vpos, hitCoord);
            break;
        }
    }
    occ += dist;
    col += (texture(gbuffer1, coord).xyz * (0.07999999821186065673828125 - dist));
}

vec3 tangent(vec3 n)
{
    vec3 t1 = cross(n, vec3(0.0, 0.0, 1.0));
    vec3 t2 = cross(n, vec3(0.0, 1.0, 0.0));
    if (length(t1) > length(t2))
    {
        return normalize(t1);
    }
    else
    {
        return normalize(t2);
    }
}

void main()
{
    occ = 0.0;
    col = vec3(0.0);
    vec4 g0 = texture(gbuffer0, texCoord);
    float d = (texture(gbufferD, texCoord).x * 2.0) - 1.0;
    vec2 enc = g0.xy;
    vec4 n;
    n.z = (1.0 - abs(enc.x)) - abs(enc.y);
    vec2 _247;
    if (n.z >= 0.0)
    {
        _247 = enc;
    }
    else
    {
        _247 = octahedronWrap(enc);
    }
    n = vec4(_247.x, _247.y, n.z, n.w);
    vec3 _259 = normalize(n.xyz);
    n = vec4(_259.x, _259.y, _259.z, n.w);
    n.w = 1.0;
    n = tiV * n;
    vec3 _269 = normalize(n.xyz);
    n = vec4(_269.x, _269.y, _269.z, n.w);
    vpos = getPosView(viewRay, d, cameraProj);
    vec3 param = n.xyz;
    rayCast(param);
    vec3 o1 = normalize(tangent(n.xyz));
    vec3 o2 = normalize(cross(o1, n.xyz));
    vec3 c1 = (o1 + o2) * 0.5;
    vec3 c2 = (o1 - o2) * 0.5;
    vec3 param_1 = mix(n.xyz, o1, vec3(0.5));
    rayCast(param_1);
    vec3 param_2 = mix(n.xyz, o2, vec3(0.5));
    rayCast(param_2);
    vec3 param_3 = mix(n.xyz, -c1, vec3(0.5));
    rayCast(param_3);
    vec3 param_4 = mix(n.xyz, -c2, vec3(0.5));
    rayCast(param_4);
    vec3 _344 = vec3((vec3(occ) + (col * occ)) * 3.599999904632568359375);
    fragColor = vec4(_344.x, _344.y, _344.z, fragColor.w);
}

