uniform vec2 uFrequency; // custom uniform
uniform vec2 uAmplitude; // custom uniform
uniform float uTime; // custom uniform

varying vec2 vUv;
varying float vElevation;

void main() {
    // gl_Position contains the position of the Vertex on the screen
    // the goal of a vertex shader is to update this vec4 variable
    // it's vec4 cuz coordinates are in a clip space
    // the 4th value, w, is about perspective (read about it later)
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) * uAmplitude.x;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) * uAmplitude.y;

    modelPosition.z += elevation;
    
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

    vUv = uv;
    vElevation = elevation;
}