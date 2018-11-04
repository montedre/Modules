#version 330
#ifdef GL_ARB_shading_language_420pack
#extension GL_ARB_shading_language_420pack : require
#endif

uniform sampler2D gbuffer0;
uniform vec2 dirInv;
uniform sampler2D tex;

out vec4 fragColor;
in vec2 texCoord;

vec2 octahedronWrap(vec2 v)
{
    return (vec2(1.0) - abs(v.yx)) * vec2((v.x >= 0.0) ? 1.0 : (-1.0), (v.y >= 0.0) ? 1.0 : (-1.0));
}

vec3 getNor(vec2 enc)
{
    vec3 n;
    n.z = (1.0 - abs(enc.x)) - abs(enc.y);
    vec2 _61;
    if (n.z >= 0.0)
    {
        _61 = enc;
    }
    else
    {
        _61 = octahedronWrap(enc);
    }
    n = vec3(_61.x, _61.y, n.z);
    n = normalize(n);
    return n;
}

float doBlur(float blurWeight, int pos, vec3 nor, vec2 texCoord_1)
{
    float posadd = float(pos) + 0.5;
    vec3 nor2 = getNor(texture(gbuffer0, texCoord_1 + (dirInv * float(pos))).xy);
    float influenceFactor = step(0.949999988079071044921875, dot(nor2, nor));
    vec4 col = texture(tex, texCoord_1 + (dirInv * posadd));
    fragColor += ((col * blurWeight) * influenceFactor);
    float weight = blurWeight * influenceFactor;
    nor2 = getNor(texture(gbuffer0, texCoord_1 - (dirInv * float(pos))).xy);
    influenceFactor = step(0.949999988079071044921875, dot(nor2, nor));
    col = texture(tex, texCoord_1 - (dirInv * posadd));
    fragColor += ((col * blurWeight) * influenceFactor);
    weight += (blurWeight * influenceFactor);
    return weight;
}

void main()
{
    vec3 nor = getNor(texture(gbuffer0, texCoord).xy);
    fragColor = texture(tex, texCoord) * 0.227026998996734619140625;
    float weight = 0.227026998996734619140625;
    float _167 = doBlur(0.19459460675716400146484375, 1, nor, texCoord);
    weight += _167;
    float _174 = doBlur(0.121621601283550262451171875, 2, nor, texCoord);
    weight += _174;
    float _181 = doBlur(0.054053999483585357666015625, 3, nor, texCoord);
    weight += _181;
    float _188 = doBlur(0.01621600054204463958740234375, 4, nor, texCoord);
    weight += _188;
    fragColor = vec4(fragColor / vec4(weight));
}

