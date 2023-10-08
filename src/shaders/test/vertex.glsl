uniform mat4 projectionMatrix; // transform coords into the clip space 
uniform mat4 viewMatrix; // transformations relative to the camera
uniform mat4 modelMatrix; // transformations relative to the Mesh
uniform vec2 uFrequency; // custom uniform
uniform float uTime; // custom uniform

// retrieving value from our THREE geometry
attribute vec3 position;

void main() {
    // gl_Position contains the position of the Vertex on the screen
    // the goal of a vertex shader is to update this vec4 variable
    // it's vec4 cuz coordinates are in a clip space
    // the 4th value, w, is about perspective (read about it later)
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1;
    modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1;
    
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

    // vRandom = aRandom;
}