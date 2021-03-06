#version 460 core

in vec2 passTextureCoord;

out vec4 outColor;

uniform sampler2D backgroundTexture;
uniform sampler2D rTexture;
uniform sampler2D gTexture;
uniform sampler2D bTexture;
uniform sampler2D blendMap;

void main() {

    vec4 blendMapColour = texture(blendMap,passTextureCoord);

    float blackTextureAmount = 1 - (blendMapColour.r+blendMapColour.g+blendMapColour.b);
    vec2 tiledCoords = passTextureCoord *128;
    vec4 backgroundTextureColour = texture(backgroundTexture,tiledCoords)*blackTextureAmount;
    vec4 rTextureColour = texture(rTexture,tiledCoords)*blendMapColour.r;
    vec4 gTextureColour = texture(gTexture,tiledCoords)*blendMapColour.g;
    vec4 bTextureColour = texture(bTexture,tiledCoords)*blendMapColour.b;

    vec4 totalColour = backgroundTextureColour+rTextureColour+gTextureColour+bTextureColour;

    outColor = totalColour;
}