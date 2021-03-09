/*
	シルエットシェーダー by あるる（きのもと 結衣）
	Silhouette Shader by Yui Kinomoto @arlez80

	MIT License
*/

shader_type spatial;
render_mode depth_draw_never, depth_test_disable, unshaded;

uniform vec4 color : hint_color = vec4( 0.0, 0.0, 0.0, 1.0 );
uniform float bias = -0.1;

varying mat4 camera_matrix;

void vertex( )
{
	camera_matrix = CAMERA_MATRIX;
}

void fragment( )
{
	vec4 screen_pixel_vertex = vec4( vec3( SCREEN_UV, textureLod( DEPTH_TEXTURE, SCREEN_UV, 0.0 ).x ) * 2.0 - 1.0, 1.0 );
	vec4 screen_pixel_coord = INV_PROJECTION_MATRIX * screen_pixel_vertex;
	screen_pixel_coord.xyz /= screen_pixel_coord.w;
	float depth = -screen_pixel_coord.z;

	float z = -VERTEX.z;

	ALBEDO = color.rgb;
	ALPHA = color.a * float( depth < z + bias );
}

