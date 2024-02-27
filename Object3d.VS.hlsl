#include"Object3d.hlsli"

struct TransformationMatrix {
	float32_t4x4 WVP;
};
ConstantBuffer<TransformationMatrix> gTransformationMatrix : register(b0);

struct VertexShaderInput {
	float32_t4 position : POSITION0;
	float32_t2 texcoord : TEXCOORD0;
};
VertexShaderOutput main(VertexShaderInput input,uint32_t4 instanceId : SV_InstanceID) { 
	VertexShaderOutput output;
	output.position = mul(input.position, gTransformationMatrices[instanceId].WVP);
	output.texcoord=input.texcoord;
	output.normal=normalize(mul(input.normal,(float32 t3x3)gTransformationMatrices[instancedId].world));
	return output;
}



