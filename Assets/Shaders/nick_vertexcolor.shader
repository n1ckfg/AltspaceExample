﻿// http://answers.unity3d.com/questions/923726/unity-5-standard-shader-support-for-vertex-colors.html

Shader "Nick/VertexColor" {

     Properties {
         _Color ("Color", Color) = (1,1,1,1)
         _Glossiness ("Smoothness", Range(0,1)) = 0.5
         _Metallic ("Metallic", Range(0,1)) = 0.0
		 _Emissive ("Emissive", Color) = (0,0,0,1)
     }

     SubShader {
         Tags { "RenderType"="Opaque" }
         Cull Off
		 LOD 200
         
         CGPROGRAM
         #pragma surface surf Standard vertex:vert fullforwardshadows
         #pragma target 3.0
         struct Input {
             float3 vertexColor; // Vertex color stored here by vert() method
         };
         
         struct v2f {
           float4 pos : SV_POSITION;
           fixed4 color : COLOR;
         };
 
         void vert (inout appdata_full v, out Input o)
         {
             UNITY_INITIALIZE_OUTPUT(Input,o);
             o.vertexColor = v.color; // Save the Vertex Color in the Input for the surf() method
         }
 
         half _Glossiness;
         half _Metallic;
         fixed4 _Color;
		 fixed4 _Emissive;
 
         void surf (Input IN, inout SurfaceOutputStandard o) 
         {
             o.Albedo = IN.vertexColor; // Combine normal color with the vertex color
             o.Metallic = _Metallic;
             o.Smoothness = _Glossiness;
             o.Alpha = 1;
			 o.Emission = _Emissive * IN.vertexColor;
         }
         ENDCG
     } 

     FallBack "Diffuse"

 }