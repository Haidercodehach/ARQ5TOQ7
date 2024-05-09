in vec2 TexCoord;

out vec4 FragColor;

void main()
{
    FragColor = vec4(1.0, 0.0, 0.0, 1.0); // Red color
    for (int i = 1; i <= 4; i++) {
        vec2 offset = vec2(0.0, 0.1 * i);
        FragColor += vec4(1.0, 0.0, 0.0, 0.2 / i) * texture2D(Texture, TexCoord + offset);
    }
}