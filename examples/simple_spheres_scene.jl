using RayTracer, Images

screen_size = (w = 400, h = 300)

light_pos = Vec3(5.0f0, 5.0f0, -10.0f0)

eye_pos = Vec3(0.0f0, 0.35f0, -1.0f0)

scene = [
    SimpleSphere(Vec3(0.75f0, 0.1f0, 1.0f0), 0.6f0, color = rgb(0.0f0, 0.0f0, 1.0f0)),
    SimpleSphere(Vec3(-0.75f0, 0.1f0, 2.25f0), 0.6f0, color = rgb(0.5f0, 0.223f0, 0.5f0)),
    SimpleSphere(Vec3(-2.75f0, 0.1f0, 3.5f0), 0.6f0, color = rgb(1.0f0, 0.572f0, 0.184f0)),
    CheckeredSphere(Vec3(0.0f0, -99999.5f0, 0.0f0), 99999.0f0,
                    color1 = rgb(0.0f0, 1.0f0, 0.0f0),
                    color2 = rgb(0.0f0, 0.0f0, 1.0f0), reflection = 0.25f0)
    ]

origin, direction = get_primary_rays(Float32, 400, 300, 90, eye_pos)

color = raytrace(origin, direction, scene, light_pos, eye_pos, 0)

proper_shape(a) = clamp.(reshape(a, screen_size.w, screen_size.h), 0.0f0, 1.0f0)

col1 = proper_shape(color.x)
col2 = proper_shape(color.y)
col3 = proper_shape(color.z)

im_arr = permutedims(cat(col1, col2, col3, dims = 3), (3, 2, 1))

img = colorview(RGB, im_arr)

save("simple_spheres_scene.jpg", img)

light_pos = Vec3(5.0f0, 55.0f0, -10.0f0)

color = raytrace(origin, direction, scene, light_pos, eye_pos, 0)

col1 = proper_shape(color.x)
col2 = proper_shape(color.y)
col3 = proper_shape(color.z)

im_arr = permutedims(cat(col1, col2, col3, dims = 3), (3, 2, 1))

img = colorview(RGB, im_arr)

save("simple_spheres_scene_altlight.jpg", img)
