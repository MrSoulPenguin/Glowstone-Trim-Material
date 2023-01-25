#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    if (color.a < 0.1) discard;

    if (color.a != (254.0 / 255.0)) {
        color *= vertexColor;
    }
        
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
