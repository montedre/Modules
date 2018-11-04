#ifndef _COMPILED_GLSL_
#define _COMPILED_GLSL_
#define _Irr
#define _EnvCol
#define _Deferred
#define _CSM
#define _RTGI
#define _VoxelCones5
#define _IndPos
#define _SMAA
#define _Veloc
#define _SSAO
#define _gbuffer2
#define _CToneFilmic
const float PI = 3.1415926535;
const float PI2 = PI * 2.0;
const vec2 shadowmapSize = vec2(4096, 4096);
const float shadowmapCubePcfSize = 0.001;
const int shadowmapCascades = 4;
const int ssgiMaxSteps = 8;
const float ssgiRayStep = 0.005 * 2.0;
const float ssgiStrength = 1.0;
const float bloomThreshold = 1.0;
const float bloomStrength = 3.5;
const float bloomRadius = 3.0;
const float ssrRayStep = 0.04;
const float ssrMinRayStep = 0.05;
const float ssrSearchDist = 5.0;
const float ssrFalloffExp = 5.0;
const float ssrJitter = 0.6;
const ivec3 voxelgiResolution = ivec3(128, 128, 128);
const vec3 voxelgiHalfExtents = vec3(8, 8, 8);
const float voxelgiDiff = 3.0;
const float voxelgiSpec = 1.0;
const float voxelgiOcc = 1.0;
const float voxelgiEnv = 0.0 / 10.0;
const float voxelgiStep = 1.0;
const float voxelgiRange = 2.0;
const float voxelgiOffset = 1.0;
const int skinMaxBones = 8;

#endif // _COMPILED_GLSL_
