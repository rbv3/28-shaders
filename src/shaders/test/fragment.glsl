precision mediump float; // how precise is the float (use mediump as default)

// Retrieve info from VertexShader
varying float vRandom;

void main() {
    // gl_FragColor is the color of the particular pixel
    // 4th value is the alpha, a, on rgba
    gl_FragColor = vec4(vRandom, vRandom * 0.5, 1.0, 1.0);
}