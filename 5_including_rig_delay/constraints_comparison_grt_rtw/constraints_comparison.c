/*
 * constraints_comparison.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "constraints_comparison".
 *
 * Model version              : 1.26
 * Simulink Coder version : 8.8 (R2015a) 09-Feb-2015
 * C source code generated on : Mon Oct 31 10:30:45 2016
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "constraints_comparison.h"
#include "constraints_comparison_private.h"

/* Block signals (auto storage) */
B_constraints_comparison_T constraints_comparison_B;

/* Continuous states */
X_constraints_comparison_T constraints_comparison_X;

/* Block states (auto storage) */
DW_constraints_comparison_T constraints_comparison_DW;

/* Real-time model */
RT_MODEL_constraints_comparis_T constraints_comparison_M_;
RT_MODEL_constraints_comparis_T *const constraints_comparison_M =
  &constraints_comparison_M_;

/* Forward declaration for local functions */
static void constraints_comparison_mldivide(const real_T A[49], real_T B[7]);

/*
 * This function updates continuous states using the ODE4 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE4_IntgData *id = (ODE4_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T *f3 = id->f[3];
  real_T temp;
  int_T i;
  int_T nXc = 14;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  constraints_comparison_derivatives();

  /* f1 = f(t + (h/2), y + (h/2)*f0) */
  temp = 0.5 * h;
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (temp*f0[i]);
  }

  rtsiSetT(si, t + temp);
  rtsiSetdX(si, f1);
  constraints_comparison_step();
  constraints_comparison_derivatives();

  /* f2 = f(t + (h/2), y + (h/2)*f1) */
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (temp*f1[i]);
  }

  rtsiSetdX(si, f2);
  constraints_comparison_step();
  constraints_comparison_derivatives();

  /* f3 = f(t + h, y + h*f2) */
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (h*f2[i]);
  }

  rtsiSetT(si, tnew);
  rtsiSetdX(si, f3);
  constraints_comparison_step();
  constraints_comparison_derivatives();

  /* tnew = t + h
     ynew = y + (h/6)*(f0 + 2*f1 + 2*f2 + 2*f3) */
  temp = h / 6.0;
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + temp*(f0[i] + 2.0*f1[i] + 2.0*f2[i] + f3[i]);
  }

  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Function for MATLAB Function: '<Root>/MATLAB Function' */
static void constraints_comparison_mldivide(const real_T A[49], real_T B[7])
{
  real_T temp;
  real_T b_A[49];
  int8_T ipiv[7];
  int32_T j;
  int32_T c;
  int32_T ix;
  real_T s;
  int32_T jy;
  int32_T c_ix;
  int32_T d;
  int32_T ijA;
  int32_T b_kAcol;
  memcpy(&b_A[0], &A[0], 49U * sizeof(real_T));
  for (j = 0; j < 7; j++) {
    ipiv[j] = (int8_T)(1 + j);
  }

  for (j = 0; j < 6; j++) {
    c = j << 3;
    jy = 0;
    ix = c;
    temp = fabs(b_A[c]);
    for (b_kAcol = 2; b_kAcol <= 7 - j; b_kAcol++) {
      ix++;
      s = fabs(b_A[ix]);
      if (s > temp) {
        jy = b_kAcol - 1;
        temp = s;
      }
    }

    if (b_A[c + jy] != 0.0) {
      if (jy != 0) {
        ipiv[j] = (int8_T)((j + jy) + 1);
        ix = j;
        b_kAcol = j + jy;
        for (jy = 0; jy < 7; jy++) {
          temp = b_A[ix];
          b_A[ix] = b_A[b_kAcol];
          b_A[b_kAcol] = temp;
          ix += 7;
          b_kAcol += 7;
        }
      }

      ix = (c - j) + 7;
      for (b_kAcol = c + 1; b_kAcol + 1 <= ix; b_kAcol++) {
        b_A[b_kAcol] /= b_A[c];
      }
    }

    b_kAcol = c;
    jy = c + 7;
    for (ix = 1; ix <= 6 - j; ix++) {
      temp = b_A[jy];
      if (b_A[jy] != 0.0) {
        c_ix = c + 1;
        d = (b_kAcol - j) + 14;
        for (ijA = 8 + b_kAcol; ijA + 1 <= d; ijA++) {
          b_A[ijA] += b_A[c_ix] * -temp;
          c_ix++;
        }
      }

      jy += 7;
      b_kAcol += 7;
    }
  }

  for (ix = 0; ix < 6; ix++) {
    if (ix + 1 != ipiv[ix]) {
      temp = B[ix];
      B[ix] = B[ipiv[ix] - 1];
      B[ipiv[ix] - 1] = temp;
    }
  }

  for (ix = 0; ix < 7; ix++) {
    b_kAcol = 7 * ix;
    if (B[ix] != 0.0) {
      for (jy = ix + 1; jy + 1 < 8; jy++) {
        B[jy] -= b_A[jy + b_kAcol] * B[ix];
      }
    }
  }

  for (ix = 6; ix >= 0; ix += -1) {
    b_kAcol = 7 * ix;
    if (B[ix] != 0.0) {
      B[ix] /= b_A[ix + b_kAcol];
      for (jy = 0; jy + 1 <= ix; jy++) {
        B[jy] -= b_A[jy + b_kAcol] * B[ix];
      }
    }
  }
}

/* Model step function */
void constraints_comparison_step(void)
{
  /* local block i/o variables */
  real_T rtb_Integrator70;
  real_T rtb_Integrator71;
  real_T rtb_Integrator72;
  real_T rtb_Integrator73;
  real_T rtb_Integrator74;
  real_T rtb_Integrator75;
  real_T rtb_Integrator76;
  real_T p_in[3];
  real_T E_dasha[12];
  static const real_T b[9] = { 0.008083, -0.0, -0.0, -0.0, 0.038, -0.0, -0.0,
    -0.0, 0.061206 };

  static const real_T c[21] = { 1.97, 0.0, 0.0, 0.0, 1.97, 0.0, 0.0, 0.0, 1.97,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 };

  real_T rtb_u[3];
  real_T rtb_TmpSignalConversionAtSFun_f[7];
  real_T c_0[49];
  real_T rtb_TmpSignalConversionAtSFun_1[12];
  real_T rtb_TmpSignalConversionAtSFun_2[12];
  real_T rtb_TmpSignalConversionAtSFun_3[9];
  int32_T i;
  real_T tmp[12];
  real_T tmp_0[12];
  real_T rtb_TmpSignalConversionAtSFun_4[12];
  real_T tmp_1[4];
  real_T tmp_2[16];
  int32_T i_0;
  real_T rtb_sincos_o1_idx_0;
  real_T rtb_sincos_o1_idx_1;
  real_T rtb_sincos_o1_idx_2;
  real_T rtb_TmpSignalConversionAtSFun_5;
  real_T rtb_TmpSignalConversionAtSFun_6;
  real_T rtb_TmpSignalConversionAtSFun_7;
  real_T rtb_TmpSignalConversionAtSFun_8;
  real_T rtb_sincos_o2_idx_0;
  real_T rtb_sincos_o2_idx_1;
  real_T rtb_sincos_o2_idx_2;
  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* set solver stop time */
    if (!(constraints_comparison_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&constraints_comparison_M->solverInfo,
                            ((constraints_comparison_M->Timing.clockTickH0 + 1) *
        constraints_comparison_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&constraints_comparison_M->solverInfo,
                            ((constraints_comparison_M->Timing.clockTick0 + 1) *
        constraints_comparison_M->Timing.stepSize0 +
        constraints_comparison_M->Timing.clockTickH0 *
        constraints_comparison_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(constraints_comparison_M)) {
    constraints_comparison_M->Timing.t[0] = rtsiGetT
      (&constraints_comparison_M->solverInfo);
  }

  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Gain: '<S219>/1//2' incorporates:
     *  Constant: '<Root>/Constant'
     *  Gain: '<S216>/Unit Conversion'
     */
    rtb_u[0] = constraints_comparison_P.UnitConversion_Gain *
      constraints_comparison_P.Constant_Value[0] *
      constraints_comparison_P.u_Gain;
    rtb_u[1] = constraints_comparison_P.UnitConversion_Gain *
      constraints_comparison_P.Constant_Value[1] *
      constraints_comparison_P.u_Gain;
    rtb_u[2] = constraints_comparison_P.UnitConversion_Gain *
      constraints_comparison_P.Constant_Value[2] *
      constraints_comparison_P.u_Gain;

    /* Trigonometry: '<S219>/sincos' */
    rtb_sincos_o2_idx_0 = sin(rtb_u[0]);
    rtb_sincos_o1_idx_0 = cos(rtb_u[0]);
    rtb_sincos_o2_idx_1 = sin(rtb_u[1]);
    rtb_sincos_o1_idx_1 = cos(rtb_u[1]);
    rtb_sincos_o2_idx_2 = sin(rtb_u[2]);
    rtb_sincos_o1_idx_2 = cos(rtb_u[2]);

    /* SignalConversion: '<S217>/TmpSignal ConversionAt SFunction Inport1' incorporates:
     *  Fcn: '<S219>/q0'
     *  Fcn: '<S219>/q1'
     *  Fcn: '<S219>/q2'
     *  Fcn: '<S219>/q3'
     *  MATLAB Function: '<S5>/MATLAB Function'
     */
    rtb_TmpSignalConversionAtSFun_5 = rtb_sincos_o1_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o1_idx_2 + rtb_sincos_o2_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o2_idx_2;
    rtb_TmpSignalConversionAtSFun_6 = rtb_sincos_o1_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o2_idx_2 - rtb_sincos_o2_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o1_idx_2;
    rtb_TmpSignalConversionAtSFun_7 = rtb_sincos_o1_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o1_idx_2 + rtb_sincos_o2_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o2_idx_2;
    rtb_TmpSignalConversionAtSFun_8 = rtb_sincos_o2_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o1_idx_2 - rtb_sincos_o1_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o2_idx_2;

    /* MATLAB Function: '<S5>/MATLAB Function' */
    /* MATLAB Function 'Subsystem5/MATLAB Function': '<S217>:1' */
    /*  Initial position */
    /* '<S217>:1:11' */
    /* '<S217>:1:12' */
    /* '<S217>:1:13' */
    /* '<S217>:1:14' */
    /* '<S217>:1:16' */
    /* '<S217>:1:20' */
    /* '<S217>:1:24' */
    /* '<S217>:1:26' */
    rtb_TmpSignalConversionAtSFun_1[0] = -rtb_TmpSignalConversionAtSFun_6;
    rtb_TmpSignalConversionAtSFun_1[3] = rtb_TmpSignalConversionAtSFun_5;
    rtb_TmpSignalConversionAtSFun_1[6] = -rtb_TmpSignalConversionAtSFun_8;
    rtb_TmpSignalConversionAtSFun_1[9] = rtb_TmpSignalConversionAtSFun_7;
    rtb_TmpSignalConversionAtSFun_1[1] = -rtb_TmpSignalConversionAtSFun_7;
    rtb_TmpSignalConversionAtSFun_1[4] = rtb_TmpSignalConversionAtSFun_8;
    rtb_TmpSignalConversionAtSFun_1[7] = rtb_TmpSignalConversionAtSFun_5;
    rtb_TmpSignalConversionAtSFun_1[10] = -rtb_TmpSignalConversionAtSFun_6;
    rtb_TmpSignalConversionAtSFun_1[2] = -rtb_TmpSignalConversionAtSFun_8;
    rtb_TmpSignalConversionAtSFun_1[5] = -rtb_TmpSignalConversionAtSFun_7;
    rtb_TmpSignalConversionAtSFun_1[8] = rtb_TmpSignalConversionAtSFun_6;
    rtb_TmpSignalConversionAtSFun_1[11] = rtb_TmpSignalConversionAtSFun_5;
    rtb_TmpSignalConversionAtSFun_2[0] = -rtb_TmpSignalConversionAtSFun_6;
    rtb_TmpSignalConversionAtSFun_2[1] = rtb_TmpSignalConversionAtSFun_5;
    rtb_TmpSignalConversionAtSFun_2[2] = rtb_TmpSignalConversionAtSFun_8;
    rtb_TmpSignalConversionAtSFun_2[3] = -rtb_TmpSignalConversionAtSFun_7;
    rtb_TmpSignalConversionAtSFun_2[4] = -rtb_TmpSignalConversionAtSFun_7;
    rtb_TmpSignalConversionAtSFun_2[5] = -rtb_TmpSignalConversionAtSFun_8;
    rtb_TmpSignalConversionAtSFun_2[6] = rtb_TmpSignalConversionAtSFun_5;
    rtb_TmpSignalConversionAtSFun_2[7] = rtb_TmpSignalConversionAtSFun_6;
    rtb_TmpSignalConversionAtSFun_2[8] = -rtb_TmpSignalConversionAtSFun_8;
    rtb_TmpSignalConversionAtSFun_2[9] = rtb_TmpSignalConversionAtSFun_7;
    rtb_TmpSignalConversionAtSFun_2[10] = -rtb_TmpSignalConversionAtSFun_6;
    rtb_TmpSignalConversionAtSFun_2[11] = rtb_TmpSignalConversionAtSFun_5;
    for (i = 0; i < 3; i++) {
      for (i_0 = 0; i_0 < 3; i_0++) {
        rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] = 0.0;
        rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] +=
          rtb_TmpSignalConversionAtSFun_2[i_0 << 2] *
          rtb_TmpSignalConversionAtSFun_1[i];
        rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] +=
          rtb_TmpSignalConversionAtSFun_2[(i_0 << 2) + 1] *
          rtb_TmpSignalConversionAtSFun_1[i + 3];
        rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] +=
          rtb_TmpSignalConversionAtSFun_2[(i_0 << 2) + 2] *
          rtb_TmpSignalConversionAtSFun_1[i + 6];
        rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] +=
          rtb_TmpSignalConversionAtSFun_2[(i_0 << 2) + 3] *
          rtb_TmpSignalConversionAtSFun_1[i + 9];
      }
    }

    for (i = 0; i < 3; i++) {
      p_in[i] = rtb_TmpSignalConversionAtSFun_3[i + 6] * 0.0 +
        (rtb_TmpSignalConversionAtSFun_3[i + 3] * 0.0 +
         rtb_TmpSignalConversionAtSFun_3[i] * 0.8);
    }

    /* '<S217>:1:28' */
    constraints_comparison_B.x_ini = p_in[0];

    /* '<S217>:1:29' */
    constraints_comparison_B.y_ini = p_in[1];

    /* '<S217>:1:30' */
    constraints_comparison_B.z_ini = p_in[2];
  }

  /* Integrator: '<S5>/Integrator70' */
  if (constraints_comparison_DW.Integrator70_IWORK.IcNeedsLoading) {
    constraints_comparison_X.Integrator70_CSTATE =
      constraints_comparison_B.x_ini;
  }

  rtb_Integrator70 = constraints_comparison_X.Integrator70_CSTATE;

  /* Integrator: '<S5>/Integrator71' */
  if (constraints_comparison_DW.Integrator71_IWORK.IcNeedsLoading) {
    constraints_comparison_X.Integrator71_CSTATE =
      constraints_comparison_B.y_ini;
  }

  rtb_Integrator71 = constraints_comparison_X.Integrator71_CSTATE;

  /* Integrator: '<S5>/Integrator72' */
  if (constraints_comparison_DW.Integrator72_IWORK.IcNeedsLoading) {
    constraints_comparison_X.Integrator72_CSTATE =
      constraints_comparison_B.z_ini;
  }

  rtb_Integrator72 = constraints_comparison_X.Integrator72_CSTATE;
  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Gain: '<S218>/1//2' incorporates:
     *  Constant: '<Root>/Constant3'
     *  Constant: '<Root>/Constant4'
     *  Constant: '<Root>/Constant5'
     *  Gain: '<S215>/Unit Conversion'
     */
    rtb_u[0] = constraints_comparison_P.UnitConversion_Gain_c *
      constraints_comparison_P.Constant3_Value *
      constraints_comparison_P.u_Gain_d;
    rtb_u[1] = constraints_comparison_P.UnitConversion_Gain_c *
      constraints_comparison_P.Constant4_Value *
      constraints_comparison_P.u_Gain_d;
    rtb_u[2] = constraints_comparison_P.UnitConversion_Gain_c *
      constraints_comparison_P.Constant5_Value *
      constraints_comparison_P.u_Gain_d;

    /* Trigonometry: '<S218>/sincos' */
    rtb_sincos_o1_idx_0 = sin(rtb_u[0]);
    rtb_sincos_o2_idx_0 = cos(rtb_u[0]);
    rtb_sincos_o1_idx_1 = sin(rtb_u[1]);
    rtb_sincos_o2_idx_1 = cos(rtb_u[1]);
    rtb_sincos_o1_idx_2 = sin(rtb_u[2]);
    rtb_sincos_o2_idx_2 = cos(rtb_u[2]);

    /* Fcn: '<S218>/q0' */
    constraints_comparison_B.q0 = rtb_sincos_o2_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o2_idx_2 + rtb_sincos_o1_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o1_idx_2;
  }

  /* Integrator: '<S5>/Integrator73' */
  if (constraints_comparison_DW.Integrator73_IWORK.IcNeedsLoading) {
    constraints_comparison_X.Integrator73_CSTATE = constraints_comparison_B.q0;
  }

  rtb_Integrator73 = constraints_comparison_X.Integrator73_CSTATE;
  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Fcn: '<S218>/q1' */
    constraints_comparison_B.q1 = rtb_sincos_o2_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o1_idx_2 - rtb_sincos_o1_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o2_idx_2;
  }

  /* Integrator: '<S5>/Integrator74' */
  if (constraints_comparison_DW.Integrator74_IWORK.IcNeedsLoading) {
    constraints_comparison_X.Integrator74_CSTATE = constraints_comparison_B.q1;
  }

  rtb_Integrator74 = constraints_comparison_X.Integrator74_CSTATE;
  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Fcn: '<S218>/q2' */
    constraints_comparison_B.q2 = rtb_sincos_o2_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o2_idx_2 + rtb_sincos_o1_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o1_idx_2;
  }

  /* Integrator: '<S5>/Integrator75' */
  if (constraints_comparison_DW.Integrator75_IWORK.IcNeedsLoading) {
    constraints_comparison_X.Integrator75_CSTATE = constraints_comparison_B.q2;
  }

  rtb_Integrator75 = constraints_comparison_X.Integrator75_CSTATE;
  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Fcn: '<S218>/q3' */
    constraints_comparison_B.q3 = rtb_sincos_o1_idx_0 * rtb_sincos_o2_idx_1 *
      rtb_sincos_o2_idx_2 - rtb_sincos_o2_idx_0 * rtb_sincos_o1_idx_1 *
      rtb_sincos_o1_idx_2;
  }

  /* Integrator: '<S5>/Integrator76' */
  if (constraints_comparison_DW.Integrator76_IWORK.IcNeedsLoading) {
    constraints_comparison_X.Integrator76_CSTATE = constraints_comparison_B.q3;
  }

  rtb_Integrator76 = constraints_comparison_X.Integrator76_CSTATE;
  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Gain: '<S207>/Unit Conversion' incorporates:
     *  Constant: '<Root>/Constant2'
     */
    constraints_comparison_B.UnitConversion =
      constraints_comparison_P.UnitConversion_Gain_l *
      constraints_comparison_P.Constant2_Value[0];

    /* Gain: '<S208>/Unit Conversion' incorporates:
     *  Constant: '<Root>/Constant2'
     */
    constraints_comparison_B.UnitConversion_c =
      constraints_comparison_P.UnitConversion_Gain_p *
      constraints_comparison_P.Constant2_Value[1];

    /* Gain: '<S212>/Unit Conversion' incorporates:
     *  Constant: '<Root>/Constant2'
     */
    constraints_comparison_B.UnitConversion_a =
      constraints_comparison_P.UnitConversion_Gain_d *
      constraints_comparison_P.Constant2_Value[2];

    /* Gain: '<S210>/Unit Conversion' incorporates:
     *  Constant: '<Root>/Constant6'
     */
    constraints_comparison_B.UnitConversion_g =
      constraints_comparison_P.UnitConversion_Gain_h *
      constraints_comparison_P.Constant6_Value;

    /* Gain: '<S209>/Unit Conversion' incorporates:
     *  Constant: '<Root>/Constant7'
     */
    constraints_comparison_B.UnitConversion_e =
      constraints_comparison_P.UnitConversion_Gain_j *
      constraints_comparison_P.Constant7_Value;

    /* Gain: '<S211>/Unit Conversion' incorporates:
     *  Constant: '<Root>/Constant8'
     */
    constraints_comparison_B.UnitConversion_m =
      constraints_comparison_P.UnitConversion_Gain_k *
      constraints_comparison_P.Constant8_Value;
  }

  /* MATLAB Function: '<S4>/MATLAB Function' incorporates:
   *  Constant: '<Root>/Constant1'
   *  SignalConversion: '<S213>/TmpSignal ConversionAt SFunction Inport4'
   */
  /* MATLAB Function 'Subsystem4/MATLAB Function': '<S213>:1' */
  /*  Initial position */
  /*  r = 0.8; */
  /*   */
  /*  x_ini = r*cos(theta_rig); */
  /*  y_ini = 0; */
  /*  z_ini = -r*sin(theta_rig); */
  /*   */
  /*  u_ini = q_rig*z_ini;  */
  /*  v_ini = 0; */
  /*  w_ini = -q_rig*x_ini; */
  /*  Initial position */
  /*  Local velocities in body axes (Cook, pg.74) */
  /* '<S213>:1:21' */
  /* '<S213>:1:22' */
  /* '<S213>:1:23' */
  /* '<S213>:1:25' */
  /* '<S213>:1:26' */
  /* '<S213>:1:27' */
  /* '<S213>:1:28' */
  /* '<S213>:1:30' */
  /* '<S213>:1:34' */
  /*  Body to inertial axes */
  /* '<S213>:1:39' */
  /*  Inertial axes velocity */
  /* '<S213>:1:42' */
  tmp[0] = -constraints_comparison_P.Constant1_Value[4];
  tmp[3] = constraints_comparison_P.Constant1_Value[3];
  tmp[6] = -constraints_comparison_P.Constant1_Value[6];
  tmp[9] = constraints_comparison_P.Constant1_Value[5];
  tmp[1] = -constraints_comparison_P.Constant1_Value[5];
  tmp[4] = constraints_comparison_P.Constant1_Value[6];
  tmp[7] = constraints_comparison_P.Constant1_Value[3];
  tmp[10] = -constraints_comparison_P.Constant1_Value[4];
  tmp[2] = -constraints_comparison_P.Constant1_Value[6];
  tmp[5] = -constraints_comparison_P.Constant1_Value[5];
  tmp[8] = constraints_comparison_P.Constant1_Value[4];
  tmp[11] = constraints_comparison_P.Constant1_Value[3];
  tmp_0[0] = -constraints_comparison_P.Constant1_Value[4];
  tmp_0[1] = constraints_comparison_P.Constant1_Value[3];
  tmp_0[2] = constraints_comparison_P.Constant1_Value[6];
  tmp_0[3] = -constraints_comparison_P.Constant1_Value[5];
  tmp_0[4] = -constraints_comparison_P.Constant1_Value[5];
  tmp_0[5] = -constraints_comparison_P.Constant1_Value[6];
  tmp_0[6] = constraints_comparison_P.Constant1_Value[3];
  tmp_0[7] = constraints_comparison_P.Constant1_Value[4];
  tmp_0[8] = -constraints_comparison_P.Constant1_Value[6];
  tmp_0[9] = constraints_comparison_P.Constant1_Value[5];
  tmp_0[10] = -constraints_comparison_P.Constant1_Value[4];
  tmp_0[11] = constraints_comparison_P.Constant1_Value[3];
  for (i = 0; i < 3; i++) {
    for (i_0 = 0; i_0 < 3; i_0++) {
      rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] = 0.0;
      rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] += tmp_0[i_0 << 2] * tmp[i];
      rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] += tmp_0[(i_0 << 2) + 1] *
        tmp[i + 3];
      rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] += tmp_0[(i_0 << 2) + 2] *
        tmp[i + 6];
      rtb_TmpSignalConversionAtSFun_3[i + 3 * i_0] += tmp_0[(i_0 << 2) + 3] *
        tmp[i + 9];
    }
  }

  rtb_sincos_o2_idx_0 = constraints_comparison_B.UnitConversion_c * 0.0 -
    constraints_comparison_B.UnitConversion_a * 0.0;
  rtb_sincos_o1_idx_0 = constraints_comparison_B.UnitConversion_a * 0.95 -
    constraints_comparison_B.UnitConversion * 0.0;
  rtb_sincos_o2_idx_1 = constraints_comparison_B.UnitConversion * 0.0 -
    constraints_comparison_B.UnitConversion_c * 0.95;
  for (i = 0; i < 3; i++) {
    rtb_u[i] = rtb_TmpSignalConversionAtSFun_3[i + 6] * rtb_sincos_o2_idx_1 +
      (rtb_TmpSignalConversionAtSFun_3[i + 3] * rtb_sincos_o1_idx_0 +
       rtb_TmpSignalConversionAtSFun_3[i] * rtb_sincos_o2_idx_0);
  }

  /* '<S213>:1:46' */
  constraints_comparison_B.u_ini = rtb_u[0];

  /* '<S213>:1:47' */
  constraints_comparison_B.v_ini = rtb_u[1];

  /* '<S213>:1:48' */
  constraints_comparison_B.w_ini = rtb_u[2];

  /* '<S213>:1:50' */
  /* '<S213>:1:55' */
  /* '<S213>:1:60' */
  /* '<S213>:1:64' */
  rtb_TmpSignalConversionAtSFun_4[0] = -rtb_Integrator74;
  rtb_TmpSignalConversionAtSFun_4[4] = -rtb_Integrator75;
  rtb_TmpSignalConversionAtSFun_4[8] = -rtb_Integrator76;
  rtb_TmpSignalConversionAtSFun_4[1] = rtb_Integrator73;
  rtb_TmpSignalConversionAtSFun_4[5] = -rtb_Integrator76;
  rtb_TmpSignalConversionAtSFun_4[9] = rtb_Integrator75;
  rtb_TmpSignalConversionAtSFun_4[2] = rtb_Integrator76;
  rtb_TmpSignalConversionAtSFun_4[6] = rtb_Integrator73;
  rtb_TmpSignalConversionAtSFun_4[10] = -rtb_Integrator74;
  rtb_TmpSignalConversionAtSFun_4[3] = -rtb_Integrator75;
  rtb_TmpSignalConversionAtSFun_4[7] = rtb_Integrator74;
  rtb_TmpSignalConversionAtSFun_4[11] = rtb_Integrator73;
  for (i = 0; i < 3; i++) {
    tmp[i << 2] = rtb_TmpSignalConversionAtSFun_4[i << 2] * 0.5;
    tmp[1 + (i << 2)] = rtb_TmpSignalConversionAtSFun_4[(i << 2) + 1] * 0.5;
    tmp[2 + (i << 2)] = rtb_TmpSignalConversionAtSFun_4[(i << 2) + 2] * 0.5;
    tmp[3 + (i << 2)] = rtb_TmpSignalConversionAtSFun_4[(i << 2) + 3] * 0.5;
  }

  for (i = 0; i < 4; i++) {
    constraints_comparison_B.q_dot[i] = 0.0;
    constraints_comparison_B.q_dot[i] += tmp[i] *
      constraints_comparison_B.UnitConversion_g;
    constraints_comparison_B.q_dot[i] += tmp[i + 4] *
      constraints_comparison_B.UnitConversion_e;
    constraints_comparison_B.q_dot[i] += tmp[i + 8] *
      constraints_comparison_B.UnitConversion_m;
  }

  /* End of MATLAB Function: '<S4>/MATLAB Function' */

  /* Integrator: '<S4>/Integrator70' */
  if (constraints_comparison_DW.Integrator70_IWORK_l.IcNeedsLoading) {
    constraints_comparison_X.Integrator70_CSTATE_b =
      constraints_comparison_B.u_ini;
  }

  constraints_comparison_B.Integrator70 =
    constraints_comparison_X.Integrator70_CSTATE_b;

  /* Integrator: '<S4>/Integrator71' */
  if (constraints_comparison_DW.Integrator71_IWORK_f.IcNeedsLoading) {
    constraints_comparison_X.Integrator71_CSTATE_b =
      constraints_comparison_B.v_ini;
  }

  constraints_comparison_B.Integrator71 =
    constraints_comparison_X.Integrator71_CSTATE_b;

  /* Integrator: '<S4>/Integrator72' */
  if (constraints_comparison_DW.Integrator72_IWORK_m.IcNeedsLoading) {
    constraints_comparison_X.Integrator72_CSTATE_b =
      constraints_comparison_B.w_ini;
  }

  constraints_comparison_B.Integrator72 =
    constraints_comparison_X.Integrator72_CSTATE_b;

  /* Integrator: '<S4>/Integrator73' */
  if (constraints_comparison_DW.Integrator73_IWORK_c.IcNeedsLoading) {
    constraints_comparison_X.Integrator73_CSTATE_f =
      constraints_comparison_B.q_dot[0];
  }

  constraints_comparison_B.Integrator73 =
    constraints_comparison_X.Integrator73_CSTATE_f;

  /* Integrator: '<S4>/Integrator74' */
  if (constraints_comparison_DW.Integrator74_IWORK_j.IcNeedsLoading) {
    constraints_comparison_X.Integrator74_CSTATE_k =
      constraints_comparison_B.q_dot[1];
  }

  constraints_comparison_B.Integrator74 =
    constraints_comparison_X.Integrator74_CSTATE_k;

  /* Integrator: '<S4>/Integrator75' */
  if (constraints_comparison_DW.Integrator75_IWORK_f.IcNeedsLoading) {
    constraints_comparison_X.Integrator75_CSTATE_l =
      constraints_comparison_B.q_dot[2];
  }

  constraints_comparison_B.Integrator75 =
    constraints_comparison_X.Integrator75_CSTATE_l;

  /* Integrator: '<S4>/Integrator76' */
  if (constraints_comparison_DW.Integrator76_IWORK_d.IcNeedsLoading) {
    constraints_comparison_X.Integrator76_CSTATE_m =
      constraints_comparison_B.q_dot[3];
  }

  constraints_comparison_B.Integrator76 =
    constraints_comparison_X.Integrator76_CSTATE_m;

  /* MATLAB Function: '<Root>/MATLAB Function' incorporates:
   *  SignalConversion: '<S1>/TmpSignal ConversionAt SFunction Inport1'
   *  SignalConversion: '<S1>/TmpSignal ConversionAt SFunction Inport2'
   */
  /* MATLAB Function 'MATLAB Function': '<S1>:1' */
  /* % Aircraft properties (Hawk) */
  /*  1.645; % kg */
  /*  0.00959; % kg.m^2 */
  /* 0.047642; % 0.044; % kg.m^2 */
  /*  0.0507; % kg.m^2 */
  /*  kg.m^2 */
  /*  Position of body axes origin (c.g. position) relative to inertial axes origin in body frame of reference */
  /* % Input position and attitude vectors */
  /* '<S1>:1:25' */
  /* '<S1>:1:26' */
  /* '<S1>:1:27' */
  /* '<S1>:1:28' */
  /* % Input linear and angular velocity vectors */
  /* '<S1>:1:35' */
  /* '<S1>:1:36' */
  /* '<S1>:1:37' */
  /* '<S1>:1:38' */
  /* % Transformation matrices */
  /* '<S1>:1:46' */
  E_dasha[0] = -rtb_Integrator74;
  E_dasha[3] = rtb_Integrator73;
  E_dasha[6] = rtb_Integrator76;
  E_dasha[9] = -rtb_Integrator75;
  E_dasha[1] = -rtb_Integrator75;
  E_dasha[4] = -rtb_Integrator76;
  E_dasha[7] = rtb_Integrator73;
  E_dasha[10] = rtb_Integrator74;
  E_dasha[2] = -rtb_Integrator76;
  E_dasha[5] = rtb_Integrator75;
  E_dasha[8] = -rtb_Integrator74;
  E_dasha[11] = rtb_Integrator73;

  /* % Mass and inertial matrix (M) of system */
  /*  Mass matrix of aircraft model */
  /*  Inertial tensor of aircraft model in body frame of reference about c.g./body axes */
  /* '<S1>:1:64' */
  /* % Aerodynamics model */
  /* % Computing external forces matrix QE */
  /*  Angular velocity of aircraft model in body frame of reference */
  /* '<S1>:1:78' */
  for (i = 0; i < 3; i++) {
    rtb_sincos_o2_idx_0 = E_dasha[i + 9] * 2.0 *
      constraints_comparison_B.Integrator76 + (E_dasha[i + 6] * 2.0 *
      constraints_comparison_B.Integrator75 + (E_dasha[i + 3] * 2.0 *
      constraints_comparison_B.Integrator74 + 2.0 * E_dasha[i] *
      constraints_comparison_B.Integrator73));
    rtb_u[i] = rtb_sincos_o2_idx_0;
  }

  /*  External translational/linear forces on aircraft model in inertial frame of reference */
  /*  Fa1 = 0; */
  /*  Fa2 = 0; */
  /*  Fa3 = m_a*9.81; */
  /* '<S1>:1:90' */
  /*  External moments on aircraft model in body frame of reference */
  /*  Ma1 = 0; */
  /*  Ma2 = 0; */
  /*  Ma3 = 0; */
  /* '<S1>:1:100' */
  /* '<S1>:1:104' */
  for (i = 0; i < 3; i++) {
    p_in[i] = b[i + 6] * rtb_u[2] + (b[i + 3] * rtb_u[1] + b[i] * rtb_u[0]);
  }

  /* % Solving equations of motion */
  /*  MM = [  M   transpose(Cq) */
  /*          Cq  zeros(size(QC,1))        ]; */
  /*   */
  /*  QQ = [  QE */
  /*          QC  ]; */
  /* '<S1>:1:121' */
  rtb_sincos_o2_idx_0 = rtb_u[1] * p_in[2] - rtb_u[2] * p_in[1];
  rtb_sincos_o1_idx_0 = rtb_u[2] * p_in[0] - rtb_u[0] * p_in[2];
  rtb_sincos_o2_idx_1 = rtb_u[0] * p_in[1] - rtb_u[1] * p_in[0];
  for (i = 0; i < 4; i++) {
    tmp_1[i] = E_dasha[3 * i + 2] * 2.0 * (0.0 - rtb_sincos_o2_idx_1) +
      (E_dasha[3 * i + 1] * 2.0 * (0.0 - rtb_sincos_o1_idx_0) + E_dasha[3 * i] *
       2.0 * (0.0 - rtb_sincos_o2_idx_0));
  }

  rtb_TmpSignalConversionAtSFun_f[0] = 0.0;
  rtb_TmpSignalConversionAtSFun_f[1] = 0.0;
  rtb_TmpSignalConversionAtSFun_f[2] = 0.0;
  rtb_TmpSignalConversionAtSFun_f[3] = tmp_1[0];
  rtb_TmpSignalConversionAtSFun_f[4] = tmp_1[1];
  rtb_TmpSignalConversionAtSFun_f[5] = tmp_1[2];
  rtb_TmpSignalConversionAtSFun_f[6] = tmp_1[3];
  for (i = 0; i < 4; i++) {
    for (i_0 = 0; i_0 < 3; i_0++) {
      tmp[i + (i_0 << 2)] = 0.0;
      tmp[i + (i_0 << 2)] += E_dasha[3 * i] * 2.0 * b[3 * i_0];
      tmp[i + (i_0 << 2)] += E_dasha[3 * i + 1] * 2.0 * b[3 * i_0 + 1];
      tmp[i + (i_0 << 2)] += E_dasha[3 * i + 2] * 2.0 * b[3 * i_0 + 2];
    }
  }

  for (i = 0; i < 3; i++) {
    tmp_0[i << 2] = tmp[i << 2] * 2.0;
    tmp_0[1 + (i << 2)] = tmp[(i << 2) + 1] * 2.0;
    tmp_0[2 + (i << 2)] = tmp[(i << 2) + 2] * 2.0;
    tmp_0[3 + (i << 2)] = tmp[(i << 2) + 3] * 2.0;
  }

  for (i = 0; i < 4; i++) {
    for (i_0 = 0; i_0 < 4; i_0++) {
      tmp_2[i + (i_0 << 2)] = 0.0;
      tmp_2[i + (i_0 << 2)] += E_dasha[3 * i_0] * tmp_0[i];
      tmp_2[i + (i_0 << 2)] += E_dasha[3 * i_0 + 1] * tmp_0[i + 4];
      tmp_2[i + (i_0 << 2)] += E_dasha[3 * i_0 + 2] * tmp_0[i + 8];
    }
  }

  for (i = 0; i < 7; i++) {
    c_0[7 * i] = c[3 * i];
    c_0[1 + 7 * i] = c[3 * i + 1];
    c_0[2 + 7 * i] = c[3 * i + 2];
  }

  for (i = 0; i < 3; i++) {
    c_0[3 + 7 * i] = 0.0;
    c_0[4 + 7 * i] = 0.0;
    c_0[5 + 7 * i] = 0.0;
    c_0[6 + 7 * i] = 0.0;
  }

  for (i = 0; i < 4; i++) {
    c_0[3 + 7 * (i + 3)] = tmp_2[i << 2];
    c_0[4 + 7 * (i + 3)] = tmp_2[(i << 2) + 1];
    c_0[5 + 7 * (i + 3)] = tmp_2[(i << 2) + 2];
    c_0[6 + 7 * (i + 3)] = tmp_2[(i << 2) + 3];
  }

  constraints_comparison_mldivide(c_0, rtb_TmpSignalConversionAtSFun_f);

  /* End of MATLAB Function: '<Root>/MATLAB Function' */
  /* % Output acceleration vectors */
  /* '<S1>:1:125' */
  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(constraints_comparison_M->rtwLogInfo,
                        (constraints_comparison_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* Update for Integrator: '<S5>/Integrator70' */
    constraints_comparison_DW.Integrator70_IWORK.IcNeedsLoading = 0;

    /* Update for Integrator: '<S5>/Integrator71' */
    constraints_comparison_DW.Integrator71_IWORK.IcNeedsLoading = 0;

    /* Update for Integrator: '<S5>/Integrator72' */
    constraints_comparison_DW.Integrator72_IWORK.IcNeedsLoading = 0;

    /* Update for Integrator: '<S5>/Integrator73' */
    constraints_comparison_DW.Integrator73_IWORK.IcNeedsLoading = 0;

    /* Update for Integrator: '<S5>/Integrator74' */
    constraints_comparison_DW.Integrator74_IWORK.IcNeedsLoading = 0;

    /* Update for Integrator: '<S5>/Integrator75' */
    constraints_comparison_DW.Integrator75_IWORK.IcNeedsLoading = 0;

    /* Update for Integrator: '<S5>/Integrator76' */
    constraints_comparison_DW.Integrator76_IWORK.IcNeedsLoading = 0;

    /* Update for Integrator: '<S4>/Integrator70' */
    constraints_comparison_DW.Integrator70_IWORK_l.IcNeedsLoading = 0;

    /* Update for Integrator: '<S4>/Integrator71' */
    constraints_comparison_DW.Integrator71_IWORK_f.IcNeedsLoading = 0;

    /* Update for Integrator: '<S4>/Integrator72' */
    constraints_comparison_DW.Integrator72_IWORK_m.IcNeedsLoading = 0;

    /* Update for Integrator: '<S4>/Integrator73' */
    constraints_comparison_DW.Integrator73_IWORK_c.IcNeedsLoading = 0;

    /* Update for Integrator: '<S4>/Integrator74' */
    constraints_comparison_DW.Integrator74_IWORK_j.IcNeedsLoading = 0;

    /* Update for Integrator: '<S4>/Integrator75' */
    constraints_comparison_DW.Integrator75_IWORK_f.IcNeedsLoading = 0;

    /* Update for Integrator: '<S4>/Integrator76' */
    constraints_comparison_DW.Integrator76_IWORK_d.IcNeedsLoading = 0;
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(constraints_comparison_M)) {
    /* signal main to stop simulation */
    {                                  /* Sample time: [0.0s, 0.0s] */
      if ((rtmGetTFinal(constraints_comparison_M)!=-1) &&
          !((rtmGetTFinal(constraints_comparison_M)-
             (((constraints_comparison_M->Timing.clockTick1+
                constraints_comparison_M->Timing.clockTickH1* 4294967296.0)) *
              0.01)) > (((constraints_comparison_M->Timing.clockTick1+
                          constraints_comparison_M->Timing.clockTickH1*
                          4294967296.0)) * 0.01) * (DBL_EPSILON))) {
        rtmSetErrorStatus(constraints_comparison_M, "Simulation finished");
      }
    }

    rt_ertODEUpdateContinuousStates(&constraints_comparison_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++constraints_comparison_M->Timing.clockTick0)) {
      ++constraints_comparison_M->Timing.clockTickH0;
    }

    constraints_comparison_M->Timing.t[0] = rtsiGetSolverStopTime
      (&constraints_comparison_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.01s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.01, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       * Timer of this task consists of two 32 bit unsigned integers.
       * The two integers represent the low bits Timing.clockTick1 and the high bits
       * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
       */
      constraints_comparison_M->Timing.clockTick1++;
      if (!constraints_comparison_M->Timing.clockTick1) {
        constraints_comparison_M->Timing.clockTickH1++;
      }
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void constraints_comparison_derivatives(void)
{
  /* Derivatives for Integrator: '<S5>/Integrator70' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator70_CSTATE =
      constraints_comparison_B.Integrator70;
  }

  /* Derivatives for Integrator: '<S5>/Integrator71' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator71_CSTATE =
      constraints_comparison_B.Integrator71;
  }

  /* Derivatives for Integrator: '<S5>/Integrator72' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator72_CSTATE =
      constraints_comparison_B.Integrator72;
  }

  /* Derivatives for Integrator: '<S5>/Integrator73' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator73_CSTATE =
      constraints_comparison_B.Integrator73;
  }

  /* Derivatives for Integrator: '<S5>/Integrator74' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator74_CSTATE =
      constraints_comparison_B.Integrator74;
  }

  /* Derivatives for Integrator: '<S5>/Integrator75' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator75_CSTATE =
      constraints_comparison_B.Integrator75;
  }

  /* Derivatives for Integrator: '<S5>/Integrator76' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator76_CSTATE =
      constraints_comparison_B.Integrator76;
  }

  /* Derivatives for Integrator: '<S4>/Integrator70' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator70_CSTATE_b = 0.0;
  }

  /* Derivatives for Integrator: '<S4>/Integrator71' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator71_CSTATE_b = 0.0;
  }

  /* Derivatives for Integrator: '<S4>/Integrator72' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator72_CSTATE_b = 0.0;
  }

  /* Derivatives for Integrator: '<S4>/Integrator73' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator73_CSTATE_f = 0.0;
  }

  /* Derivatives for Integrator: '<S4>/Integrator74' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator74_CSTATE_k = 0.0;
  }

  /* Derivatives for Integrator: '<S4>/Integrator75' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator75_CSTATE_l = 0.0;
  }

  /* Derivatives for Integrator: '<S4>/Integrator76' */
  {
    ((XDot_constraints_comparison_T *)
      constraints_comparison_M->ModelData.derivs)->Integrator76_CSTATE_m = 0.0;
  }
}

/* Model initialize function */
void constraints_comparison_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)constraints_comparison_M, 0,
                sizeof(RT_MODEL_constraints_comparis_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&constraints_comparison_M->solverInfo,
                          &constraints_comparison_M->Timing.simTimeStep);
    rtsiSetTPtr(&constraints_comparison_M->solverInfo, &rtmGetTPtr
                (constraints_comparison_M));
    rtsiSetStepSizePtr(&constraints_comparison_M->solverInfo,
                       &constraints_comparison_M->Timing.stepSize0);
    rtsiSetdXPtr(&constraints_comparison_M->solverInfo,
                 &constraints_comparison_M->ModelData.derivs);
    rtsiSetContStatesPtr(&constraints_comparison_M->solverInfo, (real_T **)
                         &constraints_comparison_M->ModelData.contStates);
    rtsiSetNumContStatesPtr(&constraints_comparison_M->solverInfo,
      &constraints_comparison_M->Sizes.numContStates);
    rtsiSetErrorStatusPtr(&constraints_comparison_M->solverInfo,
                          (&rtmGetErrorStatus(constraints_comparison_M)));
    rtsiSetRTModelPtr(&constraints_comparison_M->solverInfo,
                      constraints_comparison_M);
  }

  rtsiSetSimTimeStep(&constraints_comparison_M->solverInfo, MAJOR_TIME_STEP);
  constraints_comparison_M->ModelData.intgData.y =
    constraints_comparison_M->ModelData.odeY;
  constraints_comparison_M->ModelData.intgData.f[0] =
    constraints_comparison_M->ModelData.odeF[0];
  constraints_comparison_M->ModelData.intgData.f[1] =
    constraints_comparison_M->ModelData.odeF[1];
  constraints_comparison_M->ModelData.intgData.f[2] =
    constraints_comparison_M->ModelData.odeF[2];
  constraints_comparison_M->ModelData.intgData.f[3] =
    constraints_comparison_M->ModelData.odeF[3];
  constraints_comparison_M->ModelData.contStates = ((X_constraints_comparison_T *)
    &constraints_comparison_X);
  rtsiSetSolverData(&constraints_comparison_M->solverInfo, (void *)
                    &constraints_comparison_M->ModelData.intgData);
  rtsiSetSolverName(&constraints_comparison_M->solverInfo,"ode4");
  rtmSetTPtr(constraints_comparison_M, &constraints_comparison_M->Timing.tArray
             [0]);
  rtmSetTFinal(constraints_comparison_M, 10.0);
  constraints_comparison_M->Timing.stepSize0 = 0.01;
  rtmSetFirstInitCond(constraints_comparison_M, 1);

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    constraints_comparison_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(constraints_comparison_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(constraints_comparison_M->rtwLogInfo, (NULL));
    rtliSetLogT(constraints_comparison_M->rtwLogInfo, "tout");
    rtliSetLogX(constraints_comparison_M->rtwLogInfo, "");
    rtliSetLogXFinal(constraints_comparison_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(constraints_comparison_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(constraints_comparison_M->rtwLogInfo, 0);
    rtliSetLogMaxRows(constraints_comparison_M->rtwLogInfo, 1000);
    rtliSetLogDecimation(constraints_comparison_M->rtwLogInfo, 1);
    rtliSetLogY(constraints_comparison_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(constraints_comparison_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(constraints_comparison_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &constraints_comparison_B), 0,
                sizeof(B_constraints_comparison_T));

  /* states (continuous) */
  {
    (void) memset((void *)&constraints_comparison_X, 0,
                  sizeof(X_constraints_comparison_T));
  }

  /* states (dwork) */
  (void) memset((void *)&constraints_comparison_DW, 0,
                sizeof(DW_constraints_comparison_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(constraints_comparison_M->rtwLogInfo, 0.0,
    rtmGetTFinal(constraints_comparison_M),
    constraints_comparison_M->Timing.stepSize0, (&rtmGetErrorStatus
    (constraints_comparison_M)));

  /* InitializeConditions for Integrator: '<S5>/Integrator70' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator70_CSTATE = 0.0;
  }

  constraints_comparison_DW.Integrator70_IWORK.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S5>/Integrator71' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator71_CSTATE = 0.0;
  }

  constraints_comparison_DW.Integrator71_IWORK.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S5>/Integrator72' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator72_CSTATE = 0.0;
  }

  constraints_comparison_DW.Integrator72_IWORK.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S5>/Integrator73' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator73_CSTATE = 0.0;
  }

  constraints_comparison_DW.Integrator73_IWORK.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S5>/Integrator74' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator74_CSTATE = 0.0;
  }

  constraints_comparison_DW.Integrator74_IWORK.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S5>/Integrator75' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator75_CSTATE = 0.0;
  }

  constraints_comparison_DW.Integrator75_IWORK.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S5>/Integrator76' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator76_CSTATE = 0.0;
  }

  constraints_comparison_DW.Integrator76_IWORK.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S4>/Integrator70' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator70_CSTATE_b = 0.0;
  }

  constraints_comparison_DW.Integrator70_IWORK_l.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S4>/Integrator71' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator71_CSTATE_b = 0.0;
  }

  constraints_comparison_DW.Integrator71_IWORK_f.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S4>/Integrator72' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator72_CSTATE_b = 0.0;
  }

  constraints_comparison_DW.Integrator72_IWORK_m.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S4>/Integrator73' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator73_CSTATE_f = 0.0;
  }

  constraints_comparison_DW.Integrator73_IWORK_c.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S4>/Integrator74' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator74_CSTATE_k = 0.0;
  }

  constraints_comparison_DW.Integrator74_IWORK_j.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S4>/Integrator75' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator75_CSTATE_l = 0.0;
  }

  constraints_comparison_DW.Integrator75_IWORK_f.IcNeedsLoading = 1;

  /* InitializeConditions for Integrator: '<S4>/Integrator76' */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    constraints_comparison_X.Integrator76_CSTATE_m = 0.0;
  }

  constraints_comparison_DW.Integrator76_IWORK_d.IcNeedsLoading = 1;

  /* set "at time zero" to false */
  if (rtmIsFirstInitCond(constraints_comparison_M)) {
    rtmSetFirstInitCond(constraints_comparison_M, 0);
  }
}

/* Model terminate function */
void constraints_comparison_terminate(void)
{
  /* (no terminate code required) */
}
