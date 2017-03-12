// body array
var skeleton = [];
var k = 0;
var tmStamp = Date.now();

// Use two canvases to draw incoming feeds
var canvas; 
var ctx; 
var canvas2; 
var ctx2; 

// set a fixed 2:1 for the images
var CANVW = 512;
var CANVH = 256;

// Three.js variables
var width = window.innerWidth;
var height = window.innerHeight;
var camera, scene, renderer; 
var joints = [];

var geometry, texture, mesh;
var geometry2, texture2, mesh2;
var orientationX, orientationY, orientationZ, orientationW;

var cameraX, cameraY, cameraZ;

function drawJoints(jointsIn) {
  //debugger;
  console.log('drawing');

  for (var j = 0; j < joints.length; j++ ) {
    joints[j].position.x = jointsIn[j].cameraX * window.innerWidth/4;
    joints[j].position.y = jointsIn[j].cameraY * window.innerHeight/4;
    joints[j].position.z = jointsIn[j].cameraZ * -window.innerWidth/4;
    joints[j].rotation.x = jointsIn[j].orientationX;
    joints[j].rotation.y = jointsIn[j].orientationY;
    joints[j].rotation.z = jointsIn[j].orientationZ;
  }
}

function init() {
  // Three.js renderer
  renderer = new THREE.WebGLRenderer();
  renderer.setSize(width, height);
  document.body.appendChild(renderer.domElement);
  
  // Three.js scene
  scene = new THREE.Scene();
  camera = new THREE.PerspectiveCamera(70, width / height, 1, 10000);
  camera.position.set( 0, 300, 3000 );
  scene.add(camera);
  controls = new THREE.TrackballControls( camera, renderer.domElement );

  var light = new THREE.DirectionalLight( 0xffffff );
  light.position.set( 0, 1, 1 ).normalize();
  scene.add(light);

  processData(recordedData);

  // Create cubes for joints    
  for (var i = 0; i < 25; i++) {
    var material = new THREE.MeshPhongMaterial( { color: 0xffffff }  );
    //var material = new THREE.MeshBasicMaterial({ color: 0x3b0160 });
    geometry = new THREE.SphereGeometry( 5, 5, 5 );
    geometry.applyMatrix( new THREE.Matrix4().makeTranslation( 0, 0, 0 ) );
    mesh = new THREE.Mesh( geometry, material );
    joints.push( mesh );
    scene.add( mesh ); 
  }

  
  animate();

  // Listen for window resize  
  window.addEventListener( 'resize', onWindowResize, false );
}

function onWindowResize() {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();

  renderer.setSize( window.innerWidth, window.innerHeight );
}

function processData(data) {
  for (var i = 0; i < recordedData.length; i++) {
    var bodies = data[i].bodies;
    for (var j = 0; j < bodies.length; j++) {
      if (bodies[j].tracked) {
        skeleton.push(bodies[j].joints);
      }    
    }
  }
  

}

function animate() {
  requestAnimationFrame(animate);
  
  if (k > skeleton.length-2) k = 0;

  if (Date.now() > tmStamp + 100) {
    k++;
    tmStamp = Date.now();
    drawJoints(skeleton[k]);
  }


  renderer.render(scene, camera);
  controls.update();

}

window.addEventListener('load', init);