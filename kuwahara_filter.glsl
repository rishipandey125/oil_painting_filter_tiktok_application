//Kuwahara Water Color Shader
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    const int radius = 10;
    float sub_grid_size = float(radius*radius);
    int l = radius-1;
    vec2 inv_size = vec2(1.0/iResolution.x,1.0/iResolution.y);
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    //mean and st.devs
    vec3 mean[4];
    vec3 var[4];

    //Top Left Sub-Grid
    for (int y = (-1*l); y <= 0; y++) {
      for (int x = (-1*l); x <= 0; x++) {
        vec3 pix = texture(iChannel0,uv + (vec2(x,y)*inv_size)).rgb;
        mean[0] += pix;
        var[0] += pix*pix;
      }
    }

    //Top Right Sub-Grid
    for (int y = (-1*l); y <= 0; y++) {
      for (int x = l; x >= 0; x--) {
        vec3 pix = texture(iChannel0,uv + (vec2(x,y)*inv_size)).rgb;
        mean[1] += pix;
        var[1] += pix*pix;
      }
    }
    //Bottom Left Sub-Grid
    for (int y = l; y >= 0; y--) {
      for (int x = (-1*l); x <= 0; x++) {
        vec3 pix = texture(iChannel0,uv + (vec2(x,y)*inv_size)).rgb;
        mean[2] += pix;
        var[2] += pix*pix;
      }
    }
    //Bottom Right Sub-Grid
    for (int y = l; y >= 0; y--) {
      for (int x = l; x >= 0; x--) {
        vec3 pix = texture(iChannel0,uv + (vec2(x,y)*inv_size)).rgb;
        mean[3] += pix;
        var[3] += pix*pix;
      }
    }
    //Selecting Correct Pixel
    float min_var = 1e+4;
    vec3 col = vec3(0.0);
    for (int i = 0; i < 4; i++) {
      mean[i] /= sub_grid_size;
      vec3 variance = abs((var[i]/sub_grid_size) - (mean[i]*mean[i]));
      float v = variance.r + variance.g + variance.b;
      if (v < min_var) {
        min_var = v;
        col = mean[i];
      }
    }
    // Output to screen
    fragColor = vec4(col,1.0);
}
