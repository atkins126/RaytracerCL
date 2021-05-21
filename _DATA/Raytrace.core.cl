﻿#ifndef RAYTRACE_CORE_CL
#define RAYTRACE_CORE_CL
//############################################################################## ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPix
// ピクセル

typedef struct
{
  int2   Siz;  // 総数
  int2   Pos;  // 位置
  uint4  See;  // 乱数シード
  float4 Rad;  // 輝度
  float3 Col;  // 色
}
TPix;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TEye
// 視点

typedef struct
{
  float3 Pos;  // 位置
}
TEye;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TScr
// スクリーン上のピクセル

typedef struct
{
  float2 Siz;  // サイズ
  float3 Pos;  // 位置
}
TScr;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCam
// カメラ

typedef struct
{
  TSingleM4 Mov;  // 姿勢
}
TCam;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRay
// レイ

typedef struct
{
  float3 Pos;  // 出射位置
  float3 Vec;  // ベクトル
  float3 Wei;  // ウェイト
  float3 Rad;  // 輝度
}
TRay;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTap
// 物体毎のレイの衝突点

typedef struct
{
  float  Dis;  // 衝突点までの距離
  float3 Pos;  // 衝突点の位置
  float3 Nor;  // 衝突点の法線
}
TTap;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% THit
// 最も近いレイの衝突点

typedef struct
{
  float  Dis;  // 衝突点までの距離
  float3 Pos;  // 衝突点の位置
  float3 Nor;  // 衝突点の法線
  int    Mat;  // 衝突点の材質
}
THit;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

constant float _EmiShift = 0.0001;                                                 // 放射シフト量

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reflect
// 鏡面反射

float3 Reflect( const float3 RayV, const float3 NorV )
{
  return RayV - 2.0f * ( dot( RayV, NorV ) * NorV );
}

//############################################################################## ■
#endif
