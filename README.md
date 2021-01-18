# Oil Painting Kuwahara Filter - TikTok Interactive Engineer Design Test

## Introduction
For the interactive engineer design test, I wanted to created a non-PBR shader that would provide a unique artistic style to a users video. Some of my favorite films like Spiderman Into the Spiderverese employ non-PBR shading techniques, and as TikTok emerges as the new medium for visual storytelling I think it would be really cool if it also allowed users to tell stories in a similar way!

## Implementation
To create a real-time oil painting effect I implemented the Kuwahara filter algorithm in GLSL.
The steps to compute the output for each pixel were:
* Setting a brush stroke radius.
* Calculating mean and variance of each sub-grid relative to the pixel.
* Identifying and returning the average pixel color at the sub-grid with the lowest variance.

If I were deploying this as an actual AR experience I would write a post-processing shader in HLSL and deploy via Unity or Unreal Engine, however because my personal computer can't run game engines I used ShaderToy's WebGL interface to test my code.

[ShaderToy Implementation](https://www.shadertoy.com/view/tlGcWW)

## Image Example
Here is a picture of a cute horse I took once when I was on a run.
![Horse Portrait](/imgs/horse.png)

This is the painted result with a brush radius of 8.
![Painted Horse Portrait - Brush Size 8](/imgs/painted8.png)

We can increase the brush radius to get a more blurred and thick painted look. This result has a brush radius of 20.
![Painted Horse Portrait - Brush Size 20](/imgs/painted20.png)

The larger the brush radius, the slower the frame rate. For real-time shading a brush radius of 6-10 is suggested.

## Video Example 1

## Video Example 2
