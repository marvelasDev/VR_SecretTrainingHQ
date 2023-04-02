// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32723,y:32680,varname:node_3138,prsc:2|emission-1372-OUT;n:type:ShaderForge.SFN_Color,id:1924,x:32055,y:32652,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1924,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Cubemap,id:5064,x:31838,y:32876,ptovrint:False,ptlb:Reflection Source,ptin:_ReflectionSource,varname:node_5064,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0;n:type:ShaderForge.SFN_Blend,id:1372,x:32394,y:32755,varname:node_1372,prsc:2,blmd:10,clmp:True|SRC-1924-RGB,DST-7536-OUT;n:type:ShaderForge.SFN_Lerp,id:7536,x:32055,y:32876,varname:node_7536,prsc:2|A-5852-OUT,B-5064-RGB,T-1841-OUT;n:type:ShaderForge.SFN_Vector1,id:5852,x:31838,y:32796,varname:node_5852,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Slider,id:1841,x:31681,y:33051,ptovrint:False,ptlb:Reflection Strength,ptin:_ReflectionStrength,varname:node_1841,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:1924-5064-1841;pass:END;sub:END;*/

Shader "Shader Forge/reflectiveColor" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _ReflectionSource ("Reflection Source", Cube) = "_Skybox" {}
        _ReflectionStrength ("Reflection Strength", Range(0, 1)) = 1
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
            uniform float4 _Color;
            uniform samplerCUBE _ReflectionSource;
            uniform float _ReflectionStrength;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float node_5852 = 0.5;
                float3 emissive = saturate(( lerp(float3(node_5852,node_5852,node_5852),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength) > 0.5 ? (1.0-(1.0-2.0*(lerp(float3(node_5852,node_5852,node_5852),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength)-0.5))*(1.0-_Color.rgb)) : (2.0*lerp(float3(node_5852,node_5852,node_5852),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength)*_Color.rgb) ));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
