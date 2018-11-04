#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform mat4 P;
uniform sampler2D gbufferD;
uniform vec2 cameraProj;
uniform sampler2D gbuffer0;
uniform sampler2D gbuffer1;
uniform mat4 tiV;
uniform sampler2D tex;

in vec3 viewRay;
in vec2 texCoord;
out vec4 fragColor;
float depth;
vec3 hitCoord;

vec2 unpackFloat(float f)
{
    return vec2(floor(f) / 100.0, fract(f));
}

vec2 octahedronWrap(vec2 v)
{
    return (vec2(1.0) - abs(v.yx)) * vec2((v.x >= 0.0) ? 1.0 : (-1.0), (v.y >= 0.0) ? 1.0 : (-1.0));
}

vec3 getPosView(vec3 viewRay_1, float depth_1, vec2 cameraProj_1)
{
    float linearDepth = cameraProj_1.y / (cameraProj_1.x - depth_1);
    return viewRay_1 * linearDepth;
}

float rand(vec2 co)
{
    return fract(sin(dot(co, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875);
}

vec2 getProjectedCoord(vec3 hitCoord_1)
{
    vec4 projectedCoord = P * vec4(hitCoord_1, 1.0);
    vec2 _110 = projectedCoord.xy / vec2(projectedCoord.w);
    projectedCoord = vec4(_110.x, _110.y, projectedCoord.z, projectedCoord.w);
    vec2 _118 = (projectedCoord.xy * 0.5) + vec2(0.5);
    projectedCoord = vec4(_118.x, _118.y, projectedCoord.z, projectedCoord.w);
    return projectedCoord.xy;
}

float getDeltaDepth(vec3 hitCoord_1)
{
    vec3 param = hitCoord_1;
    depth = (texture(gbufferD, getProjectedCoord(param)).x * 2.0) - 1.0;
    vec3 viewPos = getPosView(viewRay, depth, cameraProj);
    return viewPos.z - hitCoord_1.z;
}

vec4 binarySearch(inout vec3 dir)
{
    dir *= 0.5;
    hitCoord -= dir;
    vec3 param = hitCoord;
    float _166 = getDeltaDepth(param);
    if (_166 < 0.0)
    {
        hitCoord += dir;
    }
    dir *= 0.5;
    hitCoord -= dir;
    vec3 param_1 = hitCoord;
    float _180 = getDeltaDepth(param_1);
    if (_180 < 0.0)
    {
        hitCoord += dir;
    }
    dir *= 0.5;
    hitCoord -= dir;
    vec3 param_2 = hitCoord;
    float _194 = getDeltaDepth(param_2);
    if (_194 < 0.0)
    {
        hitCoord += dir;
    }
    dir *= 0.5;
    hitCoord -= dir;
    vec3 param_3 = hitCoord;
    float _208 = getDeltaDepth(param_3);
    if (_208 < 0.0)
    {
        hitCoord += dir;
    }
    dir *= 0.5;
    hitCoord -= dir;
    vec3 param_4 = hitCoord;
    float _222 = getDeltaDepth(param_4);
    if (_222 < 0.0)
    {
        hitCoord += dir;
    }
    dir *= 0.5;
    hitCoord -= dir;
    vec3 param_5 = hitCoord;
    float _236 = getDeltaDepth(param_5);
    if (_236 < 0.0)
    {
        hitCoord += dir;
    }
    dir *= 0.5;
    hitCoord -= dir;
    vec3 param_6 = hitCoord;
    float _250 = getDeltaDepth(param_6);
    if (_250 < 0.0)
    {
        hitCoord += dir;
    }
    vec3 param_7 = hitCoord;
    float _259 = getDeltaDepth(param_7);
    if (abs(_259) > 0.00999999977648258209228515625)
    {
        return vec4(0.0);
    }
    vec3 param_8 = hitCoord;
    return vec4(getProjectedCoord(param_8), 0.0, 1.0);
}

vec4 rayCast(inout vec3 dir)
{
    dir *= 0.039999999105930328369140625;
    hitCoord += dir;
    vec3 param = hitCoord;
    float _283 = getDeltaDepth(param);
    if (_283 > 0.0)
    {
        vec3 param_1 = dir;
        vec4 _289 = binarySearch(param_1);
        return _289;
    }
    hitCoord += dir;
    vec3 param_2 = hitCoord;
    float _296 = getDeltaDepth(param_2);
    if (_296 > 0.0)
    {
        vec3 param_3 = dir;
        vec4 _302 = binarySearch(param_3);
        return _302;
    }
    hitCoord += dir;
    vec3 param_4 = hitCoord;
    float _309 = getDeltaDepth(param_4);
    if (_309 > 0.0)
    {
        vec3 param_5 = dir;
        vec4 _315 = binarySearch(param_5);
        return _315;
    }
    hitCoord += dir;
    vec3 param_6 = hitCoord;
    float _322 = getDeltaDepth(param_6);
    if (_322 > 0.0)
    {
        vec3 param_7 = dir;
        vec4 _328 = binarySearch(param_7);
        return _328;
    }
    hitCoord += dir;
    vec3 param_8 = hitCoord;
    float _335 = getDeltaDepth(param_8);
    if (_335 > 0.0)
    {
        vec3 param_9 = dir;
        vec4 _341 = binarySearch(param_9);
        return _341;
    }
    hitCoord += dir;
    vec3 param_10 = hitCoord;
    float _348 = getDeltaDepth(param_10);
    if (_348 > 0.0)
    {
        vec3 param_11 = dir;
        vec4 _354 = binarySearch(param_11);
        return _354;
    }
    hitCoord += dir;
    vec3 param_12 = hitCoord;
    float _361 = getDeltaDepth(param_12);
    if (_361 > 0.0)
    {
        vec3 param_13 = dir;
        vec4 _367 = binarySearch(param_13);
        return _367;
    }
    hitCoord += dir;
    vec3 param_14 = hitCoord;
    float _374 = getDeltaDepth(param_14);
    if (_374 > 0.0)
    {
        vec3 param_15 = dir;
        vec4 _380 = binarySearch(param_15);
        return _380;
    }
    hitCoord += dir;
    vec3 param_16 = hitCoord;
    float _387 = getDeltaDepth(param_16);
    if (_387 > 0.0)
    {
        vec3 param_17 = dir;
        vec4 _393 = binarySearch(param_17);
        return _393;
    }
    hitCoord += dir;
    vec3 param_18 = hitCoord;
    float _400 = getDeltaDepth(param_18);
    if (_400 > 0.0)
    {
        vec3 param_19 = dir;
        vec4 _406 = binarySearch(param_19);
        return _406;
    }
    hitCoord += dir;
    vec3 param_20 = hitCoord;
    float _413 = getDeltaDepth(param_20);
    if (_413 > 0.0)
    {
        vec3 param_21 = dir;
        vec4 _419 = binarySearch(param_21);
        return _419;
    }
    hitCoord += dir;
    vec3 param_22 = hitCoord;
    float _426 = getDeltaDepth(param_22);
    if (_426 > 0.0)
    {
        vec3 param_23 = dir;
        vec4 _432 = binarySearch(param_23);
        return _432;
    }
    hitCoord += dir;
    vec3 param_24 = hitCoord;
    float _439 = getDeltaDepth(param_24);
    if (_439 > 0.0)
    {
        vec3 param_25 = dir;
        vec4 _445 = binarySearch(param_25);
        return _445;
    }
    hitCoord += dir;
    vec3 param_26 = hitCoord;
    float _452 = getDeltaDepth(param_26);
    if (_452 > 0.0)
    {
        vec3 param_27 = dir;
        vec4 _458 = binarySearch(param_27);
        return _458;
    }
    hitCoord += dir;
    vec3 param_28 = hitCoord;
    float _465 = getDeltaDepth(param_28);
    if (_465 > 0.0)
    {
        vec3 param_29 = dir;
        vec4 _471 = binarySearch(param_29);
        return _471;
    }
    hitCoord += dir;
    vec3 param_30 = hitCoord;
    float _478 = getDeltaDepth(param_30);
    if (_478 > 0.0)
    {
        vec3 param_31 = dir;
        vec4 _484 = binarySearch(param_31);
        return _484;
    }
    hitCoord += dir;
    vec3 param_32 = hitCoord;
    float _491 = getDeltaDepth(param_32);
    if (_491 > 0.0)
    {
        vec3 param_33 = dir;
        vec4 _497 = binarySearch(param_33);
        return _497;
    }
    hitCoord += dir;
    vec3 param_34 = hitCoord;
    float _504 = getDeltaDepth(param_34);
    if (_504 > 0.0)
    {
        vec3 param_35 = dir;
        vec4 _510 = binarySearch(param_35);
        return _510;
    }
    return vec4(0.0);
}

void main()
{
    vec4 g0 = texture(gbuffer0, texCoord);
    float roughness = unpackFloat(g0.z).y;
    if (roughness == 1.0)
    {
        fragColor = vec4(vec3(0.0).x, vec3(0.0).y, vec3(0.0).z, fragColor.w);
        return;
    }
    float spec = fract(texture(gbuffer1, texCoord).w);
    if (spec == 0.0)
    {
        fragColor = vec4(vec3(0.0).x, vec3(0.0).y, vec3(0.0).z, fragColor.w);
        return;
    }
    float d = (texture(gbufferD, texCoord).x * 2.0) - 1.0;
    if (d == 1.0)
    {
        fragColor = vec4(vec3(0.0).x, vec3(0.0).y, vec3(0.0).z, fragColor.w);
        return;
    }
    vec2 enc = g0.xy;
    vec3 n;
    n.z = (1.0 - abs(enc.x)) - abs(enc.y);
    vec2 _581;
    if (n.z >= 0.0)
    {
        _581 = enc;
    }
    else
    {
        _581 = octahedronWrap(enc);
    }
    n = vec3(_581.x, _581.y, n.z);
    n = normalize(n);
    vec4 viewNormal = vec4(n, 1.0);
    viewNormal = tiV * viewNormal;
    vec3 viewPos = getPosView(viewRay, d, cameraProj);
    vec3 reflected = normalize(reflect(viewPos, normalize(viewNormal.xyz)));
    hitCoord = viewPos;
    vec3 dir = (reflected * max(0.0500000007450580596923828125, -viewPos.z)) * (1.0 - ((rand(texCoord) * 0.60000002384185791015625) * roughness));
    vec3 param = dir;
    vec4 _635 = rayCast(param);
    vec4 coords = _635;
    vec2 deltaCoords = abs(vec2(0.5) - coords.xy);
    float screenEdgeFactor = clamp(1.0 - (deltaCoords.x + deltaCoords.y), 0.0, 1.0);
    float reflectivity = 1.0 - roughness;
    float intensity = (((pow(reflectivity, 5.0) * screenEdgeFactor) * clamp(-reflected.z, 0.0, 1.0)) * clamp((5.0 - length(viewPos - hitCoord)) * 0.20000000298023223876953125, 0.0, 1.0)) * coords.w;
    intensity = clamp(intensity, 0.0, 1.0);
    if (intensity == 0.0)
    {
        fragColor = vec4(vec3(0.0).x, vec3(0.0).y, vec3(0.0).z, fragColor.w);
        return;
    }
    vec3 reflCol = texture(tex, coords.xy).xyz;
    reflCol = clamp(reflCol, vec3(0.0), vec3(1.0));
    vec3 _699 = (reflCol * intensity) * 0.5;
    fragColor = vec4(_699.x, _699.y, _699.z, fragColor.w);
}

