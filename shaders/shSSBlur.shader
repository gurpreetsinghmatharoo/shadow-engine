//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//------BLUR CONSTANTS HERE--------
const bool blurEnable = true;
const float blurPower = 4.;
const float blurAcc = 8.;

//const float thres = 0.3;

uniform vec2 texel;
uniform float alpha;
//uniform bool opt;

const float pii = 3.14159265359;

void main()
{
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
    
    float blurFac;
    
    blurFac = (1.-gl_FragColor.r) * blurPower;
    //else blurFac = blurDist;
    
    if (blurEnable){
        /*float dist = 1.;
    
        for(float i=1.; i<blurFac; i++){
            for(float d=0.; d<pii*2.; d+=pii/blurAcc){
                vec2 newCoord = v_vTexcoord + vec2(cos(d)*texel.x*i, -sin(d)*texel.y*i);
                vec4 newFrag = texture2D(gm_BaseTexture, newCoord);
                
                if (newFrag.a<=0.){
                    dist = i/blurFac;
                    break;
                }
            }
            
            if (dist < 1.){
                break;
            }
        }
            
        gl_FragColor.a *= (0. + (dist)/2.) * alpha;*/
        
        //New blur
        //float dists = 0.;
        float dirs = 0.;
        
        for(float i=1.; i<blurPower; i++){
            for(float d=0.; d<pii*2.; d+=pii/blurAcc){
                vec2 newCoord = v_vTexcoord + vec2(cos(d)*texel.x*i, -sin(d)*texel.y*i);
                vec4 newFrag = texture2D(gm_BaseTexture, newCoord);
                
                float fac = 1.;//-gl_FragColor.r;
                
                gl_FragColor.a += newFrag.a;
                
                dirs+=fac;
            }
            
            //dists+=fac;
        }
        
        gl_FragColor.a /= dirs;
        
        gl_FragColor.a *= alpha;
    }
    
    gl_FragColor.rgb = v_vColour.rgb;
}

