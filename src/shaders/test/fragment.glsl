precision mediump float; // how precise is the float (use mediump as default)

// Retrieve info from VertexShader
varying vec2 vUv;

uniform vec3 uColor; // custom uniform
uniform sampler2D uTexture; // custom uniform

void main() {
    vec4 textureColor = texture2D(uTexture, vUv);
    // gl_FragColor is the color of the particular pixel
    // 4th value is the alpha, a, on rgba
    gl_FragColor = textureColor;

}