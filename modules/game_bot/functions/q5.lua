function drawTheMesh(mesh)
local vertex_shader = [[
#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoord;

out vec2 TexCoord;

void main()
{
    TexCoord = aTexCoord;
    gl_Position = vec4(aPos, 1.0);
}
]]

local fragment_shader = [[
#version 330 core
out vec4 FragColor;

in vec2 TexCoord;

void main()
{
    FragColor = vec4(1.0, 0.0, 0.0, 1.0); // Red color
}
]]

local shader_program = glCreateProgram()

local vertex_shader_id = glCreateShader(GL_VERTEX_SHADER)
glShaderSource(vertex_shader_id, vertex_shader)
glCompileShader(vertex_shader_id)
glAttachShader(shader_program, vertex_shader_id)

local fragment_shader_id = glCreateShader(GL_FRAGMENT_SHADER)
glShaderSource(fragment_shader_id, fragment_shader)
glCompileShader(fragment_shader_id)
glAttachShader(shader_program, fragment_shader_id)

glLinkProgram(shader_program)

glUseProgram(shader_program)

local mesh = {
    {0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0},
    {0.0, 0.0}, {1.0, 1.0}, {0.0, 1.0}
}

local vbo = glCreateBuffer(GL_ARRAY_BUFFER)
glBindBuffer(GL_ARRAY_BUFFER, vbo)
glBufferData(GL_ARRAY_BUFFER, mesh, GL_STATIC_DRAW)

local vao = glCreateBuffer(GL_VERTEX_ARRAY)
glBindBuffer(GL_VERTEX_ARRAY, vao)

glEnableVertexAttribArray(0)

glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0)

for i = 0, 3 do
    glPushMatrix()
    glRotatef(90 * i, 0, 0, 1)
    glDrawArrays(GL_TRIANGLES, 0, 6)
    glPopMatrix()
end
end