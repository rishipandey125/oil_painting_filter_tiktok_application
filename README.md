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

## Video Example 1

## Video Example 2
