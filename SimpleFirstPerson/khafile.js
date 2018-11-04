// Auto-generated
let project = new Project('SimpleFirstPerson');

project.addSources('Sources');
project.addLibrary("../../../Armory/Armory_05_win64_b27/Armory/armsdk/armory");
project.addLibrary("../../../Armory/Armory_05_win64_b27/Armory/armsdk/iron");
project.addLibrary("logic_pack");
project.addLibrary("../../../Armory/Armory_05_win64_b27/Armory/armsdk/lib/haxebullet");
project.addAssets("../../Armory/Armory_05_win64_b27/Armory/armsdk/lib/haxebullet/js/ammo/ammo.js", { notinlist: true });
project.addParameter('armory.trait.physics.bullet.PhysicsWorld');
project.addParameter("--macro keep('armory.trait.physics.bullet.PhysicsWorld')");
project.addParameter('armory.trait.physics.bullet.RigidBody');
project.addParameter("--macro keep('armory.trait.physics.bullet.RigidBody')");
project.addParameter('arm.node.SimpleFirstPeson');
project.addParameter("--macro keep('arm.node.SimpleFirstPeson')");
project.addShaders("build_SimpleFirstPerson/compiled/Shaders/*.glsl");
project.addAssets("build_SimpleFirstPerson/compiled/Assets/**", { notinlist: true });
project.addAssets("build_SimpleFirstPerson/compiled/Shaders/*.arm", { notinlist: true });
project.addAssets("../../GoogleDrive/Textures and Alphas/studio_hdr_giveaway_by_zbyg/studio001small.hdr", { notinlist: true });
project.addAssets("../../Armory/Armory_05_win64_b27/Armory/armsdk/armory/Assets/brdf.png", { notinlist: true });
project.addAssets("../../Armory/Armory_05_win64_b27/Armory/armsdk/armory/Assets/noise8.png", { notinlist: true });
project.addAssets("../../Armory/Armory_05_win64_b27/Armory/armsdk/armory/Assets/smaa_area.png", { notinlist: true });
project.addAssets("../../Armory/Armory_05_win64_b27/Armory/armsdk/armory/Assets/smaa_search.png", { notinlist: true });
project.addDefine('arm_deferred');
project.addDefine('arm_csm');
project.addDefine('rp_hdr');
project.addDefine('rp_renderer=Deferred');
project.addDefine('rp_depthprepass');
project.addDefine('rp_shadowmap');
project.addDefine('rp_shadowmap_size=1024');
project.addDefine('rp_background=World');
project.addDefine('rp_render_to_texture');
project.addDefine('rp_compositornodes');
project.addDefine('rp_antialiasing=SMAA');
project.addDefine('rp_supersampling=1');
project.addDefine('rp_gi=Off');
project.addDefine('rp_ssgi=SSAO');
project.addDefine('arm_physics');
project.addDefine('arm_bullet');
project.addDefine('arm_shaderload');
project.addDefine('arm_soundcompress');
project.addDefine('arm_skin');
project.addDefine('arm_particles_gpu');
project.addDefine('arm_particles');
project.addDefine('arm_fast');


resolve(project);
