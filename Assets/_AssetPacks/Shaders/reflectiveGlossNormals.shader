// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32925,y:32710,varname:node_3138,prsc:2|normal-7048-OUT,emission-5129-OUT;n:type:ShaderForge.SFN_Slider,id:5516,x:31220,y:33064,ptovrint:False,ptlb:Reflection Strength,ptin:_ReflectionStrength,varname:node_5516,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:4943,x:31580,y:32914,varname:node_4943,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Lerp,id:7801,x:31833,y:32891,varname:node_7801,prsc:2|A-4943-OUT,B-3544-RGB,T-7177-OUT;n:type:ShaderForge.SFN_Tex2d,id:4548,x:31580,y:32563,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_4548,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6960,x:32141,y:32470,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_6960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Cubemap,id:3544,x:31580,y:32768,ptovrint:False,ptlb:Reflection Source,ptin:_ReflectionSource,varname:node_3544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,pvfc:0|MIP-4416-OUT;n:type:ShaderForge.SFN_Blend,id:5253,x:32138,y:32773,varname:node_5253,prsc:2,blmd:10,clmp:True|SRC-7801-OUT,DST-4548-RGB;n:type:ShaderForge.SFN_Slider,id:9216,x:31981,y:32674,ptovrint:False,ptlb:Normal Strength,ptin:_NormalStrength,varname:node_9216,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Lerp,id:7048,x:32378,y:32587,varname:node_7048,prsc:2|A-3091-OUT,B-6960-RGB,T-9216-OUT;n:type:ShaderForge.SFN_Vector3,id:3091,x:32141,y:32342,varname:node_3091,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Color,id:1536,x:32138,y:32970,ptovrint:False,ptlb:Tint Color,ptin:_TintColor,varname:node_1536,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Blend,id:5129,x:32403,y:32843,varname:node_5129,prsc:2,blmd:10,clmp:True|SRC-5253-OUT,DST-1536-RGB;n:type:ShaderForge.SFN_Tex2d,id:2208,x:31037,y:32752,ptovrint:False,ptlb:Glossiness,ptin:_Glossiness,varname:node_2208,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:4416,x:31250,y:32768,varname:node_4416,prsc:2,frmn:0,frmx:1,tomn:6,tomx:0|IN-2208-R;n:type:ShaderForge.SFN_Multiply,id:7177,x:31580,y:33050,varname:node_7177,prsc:2|A-2208-R,B-5516-OUT;proporder:1536-4548-6960-9216-3544-5516-2208;pass:END;sub:END;*/

Shader "Shader Forge/reflectiveGlossNormals" {
    Properties {
        _TintColor ("Tint Color", Color) = (0.5,0.5,0.5,1)
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Normal ("Normal", 2D) = "bump" {}
        _NormalStrength ("Normal Strength", Range(0, 1)) = 1
        _ReflectionSource ("Reflection Source", Cube) = "_Skybox" {}
        _ReflectionStrength ("Reflection Strength", Range(0, 1)) = 1
        _Glossiness ("Glossiness", 2D) = "white" {}
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
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles metal 
            #pragma target 3.0
            uniform float _ReflectionStrength;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform samplerCUBE _ReflectionSource;
            uniform float _NormalStrength;
            uniform float4 _TintColor;
            uniform sampler2D _Glossiness; uniform float4 _Glossiness_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 normalLocal = lerp(float3(0,0,1),_Normal_var.rgb,_NormalStrength);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
////// Emissive:
                float node_4943 = 0.5;
                float4 _Glossiness_var = tex2D(_Glossiness,TRANSFORM_TEX(i.uv0, _Glossiness));
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 emissive = saturate(( _TintColor.rgb > 0.5 ? (1.0-(1.0-2.0*(_TintColor.rgb-0.5))*(1.0-saturate(( _Diffuse_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Diffuse_var.rgb-0.5))*(1.0-lerp(float3(node_4943,node_4943,node_4943),texCUBElod(_ReflectionSource,float4(viewReflectDirection,(_Glossiness_var.r*-6.0+6.0))).rgb,(_Glossiness_var.r*_ReflectionStrength)))) : (2.0*_Diffuse_var.rgb*lerp(float3(node_4943,node_4943,node_4943),texCUBElod(_ReflectionSource,float4(viewReflectDirection,(_Glossiness_var.r*-6.0+6.0))).rgb,(_Glossiness_var.r*_ReflectionStrength))) )))) : (2.0*_TintColor.rgb*saturate(( _Diffuse_var.rgb > 0.5 ? (1.0-(1.0-2.0*(_Diffuse_var.rgb-0.5))*(1.0-lerp(float3(node_4943,node_4943,node_4943),texCUBElod(_ReflectionSource,float4(viewReflectDirection,(_Glossiness_var.r*-6.0+6.0))).rgb,(_Glossiness_var.r*_ReflectionStrength)))) : (2.0*_Diffuse_var.rgb*lerp(float3(node_4943,node_4943,node_4943),texCUBElod(_ReflectionSource,float4(viewReflectDirection,(_Glossiness_var.r*-6.0+6.0))).rgb,(_Glossiness_var.r*_ReflectionStrength))) ))) ));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles metal 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
