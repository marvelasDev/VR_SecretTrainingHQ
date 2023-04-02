// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32718,y:32723,varname:node_3138,prsc:2|emission-5626-OUT;n:type:ShaderForge.SFN_Tex2d,id:5839,x:31732,y:32981,ptovrint:False,ptlb:Screen,ptin:_Screen,varname:node_5839,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f0e84941a50264061a1114986ac81a50,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:5626,x:32218,y:32823,varname:node_5626,prsc:2|A-7128-RGB,B-19-RGB,T-7000-OUT;n:type:ShaderForge.SFN_Color,id:7128,x:31917,y:32619,ptovrint:False,ptlb:Background Color,ptin:_BackgroundColor,varname:node_7128,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.09436294,c2:0,c3:0.2358491,c4:1;n:type:ShaderForge.SFN_Desaturate,id:7000,x:31910,y:32981,varname:node_7000,prsc:2|COL-5839-RGB;n:type:ShaderForge.SFN_Tex2d,id:19,x:31910,y:32801,ptovrint:False,ptlb:Colors,ptin:_Colors,varname:node_19,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:86a1bf08fbc924d40819ad4e399f92cd,ntxv:0,isnm:False|UVIN-168-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1281,x:31313,y:32788,varname:node_1281,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:168,x:31534,y:32788,varname:node_168,prsc:2,spu:0,spv:-0.5|UVIN-1281-UVOUT;proporder:5839-7128-19;pass:END;sub:END;*/

Shader "Shader Forge/screen" {
    Properties {
        _Screen ("Screen", 2D) = "white" {}
        _BackgroundColor ("Background Color", Color) = (0.09436294,0,0.2358491,1)
        _Colors ("Colors", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles metal 
            #pragma target 3.0
            uniform sampler2D _Screen; uniform float4 _Screen_ST;
            uniform float4 _BackgroundColor;
            uniform sampler2D _Colors; uniform float4 _Colors_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_6189 = _Time;
                float2 node_168 = (i.uv0+node_6189.g*float2(0,-0.5));
                float4 _Colors_var = tex2D(_Colors,TRANSFORM_TEX(node_168, _Colors));
                float4 _Screen_var = tex2D(_Screen,TRANSFORM_TEX(i.uv0, _Screen));
                float3 emissive = lerp(_BackgroundColor.rgb,_Colors_var.rgb,dot(_Screen_var.rgb,float3(0.3,0.59,0.11)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
