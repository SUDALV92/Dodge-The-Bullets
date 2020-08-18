//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    const vec3 weight = vec3( 0.2125, 0.7154, 0.0721 );
    vec3 colors = texture2D( gm_BaseTexture, v_vTexcoord ).rgb;
    float luminance = 0.7 * dot( colors, weight );
    gl_FragColor = gl_FragColor = vec4( luminance, luminance, luminance, 1. );
}
