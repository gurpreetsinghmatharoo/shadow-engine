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

uniform vec4 uvs;

uniform vec2 texel;
uniform float alpha;

const float pii = 3.14159265359;

uniform bool distChecking;
uniform float distBase;
uniform bool fade;

uniform float blurDist;
uniform float blurAcc;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor.rgb = vec3(1, 1, 1);
    
    //Dist checking
    /*if (distChecking){
        //Uv
        vec4 newv = uvs;
        newv.z -= newv.x;
        newv.w -= newv.y;
        
        //Point
        vec2 point = vec2(newv.x + newv.z/2., uvs.w);
        
        //Distance
        float dist = sqrt(pow(point.x - v_vTexcoord.x, 2.) + pow(point.y - v_vTexcoord.y, 2.));
        float distCheck = newv.w * distBase;
        
        float distFac = 1. - (dist/distCheck);
        
        gl_FragColor.rgb = vec3(distFac, distFac, distFac);
        
        /*float blurFac;
        blurFac = (1.-distFac) * blurDist;
        
        if (gl_FragColor.a>0.){
            float dist = 1.;
        
            for(float i=1.; i<blurFac; i++){
                for(float d=0.; d<pii*2.; d+=pii/blurAcc){
                    vec2 newCoord = v_vTexcoord + vec2(cos(d)*texel.x*i, -sin(d)*texel.y*i);
                    vec4 newFrag = texture2D(gm_BaseTexture, newCoord);
                    
                    bool outbound = newFrag.x < uvs.x || newFrag.x > uvs.z
                                || newFrag.y < uvs.y || newFrag.y > uvs.w;
                    
                    if (newFrag.a<=0. || outbound){
                        dist = i/blurFac;
                        break;
                    }
                }
                
                if (dist < 1.){
                    break;
                }
            }
                
            gl_FragColor.a = (0. + (dist)) * alpha;
        }
        
        //Fade
        //if (fade){
        //    gl_FragColor.a = distFac;
        //}
    }*/
}
