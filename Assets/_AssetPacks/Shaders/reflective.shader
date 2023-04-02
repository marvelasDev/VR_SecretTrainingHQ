// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33104,y:32723,varname:node_3138,prsc:2|emission-1301-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32396,y:32729,ptovrint:False,ptlb:Tint Color,ptin:_TintColor,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.509434,c2:0.509434,c3:0.509434,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2202,x:31894,y:32744,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_2202,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Cubemap,id:4187,x:31894,y:32945,ptovrint:False,ptlb:Reflection Source,ptin:_ReflectionSource,varname:node_4187,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0;n:type:ShaderForge.SFN_Slider,id:5365,x:31737,y:33187,ptovrint:False,ptlb:Reflection Strength,ptin:_ReflectionStrength,varname:node_5365,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:2942,x:31894,y:33106,varname:node_2942,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Lerp,id:1336,x:32112,y:33037,varname:node_1336,prsc:2|A-2942-OUT,B-4187-RGB,T-5365-OUT;n:type:ShaderForge.SFN_Blend,id:9826,x:32396,y:32886,varname:node_9826,prsc:2,blmd:10,clmp:True|SRC-2202-RGB,DST-1336-OUT;n:type:ShaderForge.SFN_Blend,id:1301,x:32661,y:32881,varname:node_1301,prsc:2,blmd:10,clmp:True|SRC-9826-OUT,DST-7241-RGB;proporder:7241-2202-4187-5365;pass:END;sub:END;*/

Shader "Shader Forge/reflective" {
    Properties {
        _TintColor ("Tint Color", Color) = (0.509434,0.509434,0.509434,1)
        _Diffuse ("Diffuse", 2D) = "white" {}
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
            uniform float4 _TintColor;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform samplerCUBE _ReflectionSource;
            uniform float _ReflectionStrength;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
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
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float node_2942 = 0.5;
                float3 emissive = saturate(( _TintColor.rgb > 0.5 ? (1.0-(1.0-2.0*(_TintColor.rgb-0.5))*(1.0-saturate(( lerp(float3(node_2942,node_2942,node_2942),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength) > 0.5 ? (1.0-(1.0-2.0*(lerp(float3(node_2942,node_2942,node_2942),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength)-0.5))*(1.0-_Diffuse_var.rgb)) : (2.0*lerp(float3(node_2942,node_2942,node_2942),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength)*_Diffuse_var.rgb) )))) : (2.0*_TintColor.rgb*saturate(( lerp(float3(node_2942,node_2942,node_2942),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength) > 0.5 ? (1.0-(1.0-2.0*(lerp(float3(node_2942,node_2942,node_2942),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength)-0.5))*(1.0-_Diffuse_var.rgb)) : (2.0*lerp(float3(node_2942,node_2942,node_2942),texCUBE(_ReflectionSource,viewReflectDirection).rgb,_ReflectionStrength)*_Diffuse_var.rgb) ))) ));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
