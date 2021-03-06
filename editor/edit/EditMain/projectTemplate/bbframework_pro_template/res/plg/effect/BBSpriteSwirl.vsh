attribute vec4 a_position;
attribute vec4 a_color;
attribute vec2 a_texCoord;

varying mediump vec2 v_texCoord;

void main() { 
  gl_Position = CC_MVPMatrix * a_position;
  v_texCoord = a_texCoord.xy;
}