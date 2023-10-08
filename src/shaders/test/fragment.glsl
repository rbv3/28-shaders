precision mediump float; // how precise is the float (use mediump as default)

uniform vec3 uColor; // custom uniform
uniform sampler2D uTexture; // custom uniform

// Retrieve info from VertexShader
varying vec2 vUv;
varying float vElevation;

void main() {
    vec4 textureColor = texture2D(uTexture, vUv);
    textureColor.rgb *= vElevation * 2.0 + 0.7;

    // gl_FragColor is the color of the particular pixel
    // 4th value is the alpha, a, on rgba
    gl_FragColor = textureColor;

}