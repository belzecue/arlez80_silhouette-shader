/*
	シルエットシェーダー by あるる（きのもと 結衣）
	Silhouette Shader by Yui Kinomoto @arlez80

	MIT License
*/

shader_type spatial;
render_mode depth_draw_never, depth_test_disable, unshaded;

uniform vec4 color : hint_color = vec4( 0.0, 0.0, 0.0, 1.0 );
uniform float bias : float = 0.009;

void fragment( )
{
	ALBEDO = color.rgb;
	ALPHA = color.a * float( texture( DEPTH_TEXTURE, SCREEN_UV ).r + bias < FRAGCOORD.z );
}

