/*
 * constraints_comparison.h
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

#ifndef RTW_HEADER_constraints_comparison_h_
#define RTW_HEADER_constraints_comparison_h_
#include <math.h>
#include <string.h>
#include <float.h>
#include <stddef.h>
#ifndef constraints_comparison_COMMON_INCLUDES_
# define constraints_comparison_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "rt_logging.h"
#endif                                 /* constraints_comparison_COMMON_INCLUDES_ */

#include "constraints_comparison_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rt_nonfinite.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetBlkStateChangeFlag
# define rtmGetBlkStateChangeFlag(rtm) ((rtm)->ModelData.blkStateChange)
#endif

#ifndef rtmSetBlkStateChangeFlag
# define rtmSetBlkStateChangeFlag(rtm, val) ((rtm)->ModelData.blkStateChange = (val))
#endif

#ifndef rtmGetContStateDisabled
# define rtmGetContStateDisabled(rtm)  ((rtm)->ModelData.contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
# define rtmSetContStateDisabled(rtm, val) ((rtm)->ModelData.contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
# define rtmGetContStates(rtm)         ((rtm)->ModelData.contStates)
#endif

#ifndef rtmSetContStates
# define rtmSetContStates(rtm, val)    ((rtm)->ModelData.contStates = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
# define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->ModelData.derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
# define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->ModelData.derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetFinalTime
# define rtmGetFinalTime(rtm)          ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetIntgData
# define rtmGetIntgData(rtm)           ((rtm)->ModelData.intgData)
#endif

#ifndef rtmSetIntgData
# define rtmSetIntgData(rtm, val)      ((rtm)->ModelData.intgData = (val))
#endif

#ifndef rtmGetOdeF
# define rtmGetOdeF(rtm)               ((rtm)->ModelData.odeF)
#endif

#ifndef rtmSetOdeF
# define rtmSetOdeF(rtm, val)          ((rtm)->ModelData.odeF = (val))
#endif

#ifndef rtmGetOdeY
# define rtmGetOdeY(rtm)               ((rtm)->ModelData.odeY)
#endif

#ifndef rtmSetOdeY
# define rtmSetOdeY(rtm, val)          ((rtm)->ModelData.odeY = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
# define rtmGetPeriodicContStateIndices(rtm) ((rtm)->ModelData.periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
# define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->ModelData.periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
# define rtmGetPeriodicContStateRanges(rtm) ((rtm)->ModelData.periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
# define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->ModelData.periodicContStateRanges = (val))
#endif

#ifndef rtmGetRTWLogInfo
# define rtmGetRTWLogInfo(rtm)         ((rtm)->rtwLogInfo)
#endif

#ifndef rtmGetZCCacheNeedsReset
# define rtmGetZCCacheNeedsReset(rtm)  ((rtm)->ModelData.zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
# define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->ModelData.zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetdX
# define rtmGetdX(rtm)                 ((rtm)->ModelData.derivs)
#endif

#ifndef rtmSetdX
# define rtmSetdX(rtm, val)            ((rtm)->ModelData.derivs = (val))
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
# define rtmGetStopRequested(rtm)      ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
# define rtmSetStopRequested(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
# define rtmGetStopRequestedPtr(rtm)   (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
# define rtmGetT(rtm)                  (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmGetTFinal
# define rtmGetTFinal(rtm)             ((rtm)->Timing.tFinal)
#endif

/* Block signals (auto storage) */
typedef struct {
  real_T q0;                           /* '<S218>/q0' */
  real_T q1;                           /* '<S218>/q1' */
  real_T q2;                           /* '<S218>/q2' */
  real_T q3;                           /* '<S218>/q3' */
  real_T UnitConversion;               /* '<S207>/Unit Conversion' */
  real_T UnitConversion_c;             /* '<S208>/Unit Conversion' */
  real_T UnitConversion_a;             /* '<S212>/Unit Conversion' */
  real_T UnitConversion_g;             /* '<S210>/Unit Conversion' */
  real_T UnitConversion_e;             /* '<S209>/Unit Conversion' */
  real_T UnitConversion_m;             /* '<S211>/Unit Conversion' */
  real_T Integrator70;                 /* '<S4>/Integrator70' */
  real_T Integrator71;                 /* '<S4>/Integrator71' */
  real_T Integrator72;                 /* '<S4>/Integrator72' */
  real_T Integrator73;                 /* '<S4>/Integrator73' */
  real_T Integrator74;                 /* '<S4>/Integrator74' */
  real_T Integrator75;                 /* '<S4>/Integrator75' */
  real_T Integrator76;                 /* '<S4>/Integrator76' */
  real_T x_ini;                        /* '<S5>/MATLAB Function' */
  real_T y_ini;                        /* '<S5>/MATLAB Function' */
  real_T z_ini;                        /* '<S5>/MATLAB Function' */
  real_T u_ini;                        /* '<S4>/MATLAB Function' */
  real_T v_ini;                        /* '<S4>/MATLAB Function' */
  real_T w_ini;                        /* '<S4>/MATLAB Function' */
  real_T q_dot[4];                     /* '<S4>/MATLAB Function' */
} B_constraints_comparison_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  struct {
    int_T IcNeedsLoading;
  } Integrator70_IWORK;                /* '<S5>/Integrator70' */

  struct {
    int_T IcNeedsLoading;
  } Integrator71_IWORK;                /* '<S5>/Integrator71' */

  struct {
    int_T IcNeedsLoading;
  } Integrator72_IWORK;                /* '<S5>/Integrator72' */

  struct {
    int_T IcNeedsLoading;
  } Integrator73_IWORK;                /* '<S5>/Integrator73' */

  struct {
    int_T IcNeedsLoading;
  } Integrator74_IWORK;                /* '<S5>/Integrator74' */

  struct {
    int_T IcNeedsLoading;
  } Integrator75_IWORK;                /* '<S5>/Integrator75' */

  struct {
    int_T IcNeedsLoading;
  } Integrator76_IWORK;                /* '<S5>/Integrator76' */

  struct {
    int_T IcNeedsLoading;
  } Integrator70_IWORK_l;              /* '<S4>/Integrator70' */

  struct {
    int_T IcNeedsLoading;
  } Integrator71_IWORK_f;              /* '<S4>/Integrator71' */

  struct {
    int_T IcNeedsLoading;
  } Integrator72_IWORK_m;              /* '<S4>/Integrator72' */

  struct {
    int_T IcNeedsLoading;
  } Integrator73_IWORK_c;              /* '<S4>/Integrator73' */

  struct {
    int_T IcNeedsLoading;
  } Integrator74_IWORK_j;              /* '<S4>/Integrator74' */

  struct {
    int_T IcNeedsLoading;
  } Integrator75_IWORK_f;              /* '<S4>/Integrator75' */

  struct {
    int_T IcNeedsLoading;
  } Integrator76_IWORK_d;              /* '<S4>/Integrator76' */
} DW_constraints_comparison_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator70_CSTATE;          /* '<S5>/Integrator70' */
  real_T Integrator71_CSTATE;          /* '<S5>/Integrator71' */
  real_T Integrator72_CSTATE;          /* '<S5>/Integrator72' */
  real_T Integrator73_CSTATE;          /* '<S5>/Integrator73' */
  real_T Integrator74_CSTATE;          /* '<S5>/Integrator74' */
  real_T Integrator75_CSTATE;          /* '<S5>/Integrator75' */
  real_T Integrator76_CSTATE;          /* '<S5>/Integrator76' */
  real_T Integrator70_CSTATE_b;        /* '<S4>/Integrator70' */
  real_T Integrator71_CSTATE_b;        /* '<S4>/Integrator71' */
  real_T Integrator72_CSTATE_b;        /* '<S4>/Integrator72' */
  real_T Integrator73_CSTATE_f;        /* '<S4>/Integrator73' */
  real_T Integrator74_CSTATE_k;        /* '<S4>/Integrator74' */
  real_T Integrator75_CSTATE_l;        /* '<S4>/Integrator75' */
  real_T Integrator76_CSTATE_m;        /* '<S4>/Integrator76' */
} X_constraints_comparison_T;

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator70_CSTATE;          /* '<S5>/Integrator70' */
  real_T Integrator71_CSTATE;          /* '<S5>/Integrator71' */
  real_T Integrator72_CSTATE;          /* '<S5>/Integrator72' */
  real_T Integrator73_CSTATE;          /* '<S5>/Integrator73' */
  real_T Integrator74_CSTATE;          /* '<S5>/Integrator74' */
  real_T Integrator75_CSTATE;          /* '<S5>/Integrator75' */
  real_T Integrator76_CSTATE;          /* '<S5>/Integrator76' */
  real_T Integrator70_CSTATE_b;        /* '<S4>/Integrator70' */
  real_T Integrator71_CSTATE_b;        /* '<S4>/Integrator71' */
  real_T Integrator72_CSTATE_b;        /* '<S4>/Integrator72' */
  real_T Integrator73_CSTATE_f;        /* '<S4>/Integrator73' */
  real_T Integrator74_CSTATE_k;        /* '<S4>/Integrator74' */
  real_T Integrator75_CSTATE_l;        /* '<S4>/Integrator75' */
  real_T Integrator76_CSTATE_m;        /* '<S4>/Integrator76' */
} XDot_constraints_comparison_T;

/* State disabled  */
typedef struct {
  boolean_T Integrator70_CSTATE;       /* '<S5>/Integrator70' */
  boolean_T Integrator71_CSTATE;       /* '<S5>/Integrator71' */
  boolean_T Integrator72_CSTATE;       /* '<S5>/Integrator72' */
  boolean_T Integrator73_CSTATE;       /* '<S5>/Integrator73' */
  boolean_T Integrator74_CSTATE;       /* '<S5>/Integrator74' */
  boolean_T Integrator75_CSTATE;       /* '<S5>/Integrator75' */
  boolean_T Integrator76_CSTATE;       /* '<S5>/Integrator76' */
  boolean_T Integrator70_CSTATE_b;     /* '<S4>/Integrator70' */
  boolean_T Integrator71_CSTATE_b;     /* '<S4>/Integrator71' */
  boolean_T Integrator72_CSTATE_b;     /* '<S4>/Integrator72' */
  boolean_T Integrator73_CSTATE_f;     /* '<S4>/Integrator73' */
  boolean_T Integrator74_CSTATE_k;     /* '<S4>/Integrator74' */
  boolean_T Integrator75_CSTATE_l;     /* '<S4>/Integrator75' */
  boolean_T Integrator76_CSTATE_m;     /* '<S4>/Integrator76' */
} XDis_constraints_comparison_T;

#ifndef ODE4_INTG
#define ODE4_INTG

/* ODE4 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[4];                        /* derivatives */
} ODE4_IntgData;

#endif

/* Parameters (auto storage) */
struct P_constraints_comparison_T_ {
  real_T Constant_Value[3];            /* Expression: [0;0;0]
                                        * Referenced by: '<Root>/Constant'
                                        */
  real_T Constant1_Value[7];           /* Expression: [0;0;0;0;0;0;0]
                                        * Referenced by: '<Root>/Constant1'
                                        */
  real_T Constant2_Value[3];           /* Expression: [0;0;0]
                                        * Referenced by: '<Root>/Constant2'
                                        */
  real_T Constant3_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/Constant3'
                                        */
  real_T Constant4_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/Constant4'
                                        */
  real_T Constant5_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/Constant5'
                                        */
  real_T Constant6_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/Constant6'
                                        */
  real_T Constant7_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/Constant7'
                                        */
  real_T Constant8_Value;              /* Expression: 0
                                        * Referenced by: '<Root>/Constant8'
                                        */
  real_T UnitConversion_Gain;          /* Expression: slope
                                        * Referenced by: '<S216>/Unit Conversion'
                                        */
  real_T u_Gain;                       /* Expression: 0.5
                                        * Referenced by: '<S219>/1//2'
                                        */
  real_T UnitConversion_Gain_c;        /* Expression: slope
                                        * Referenced by: '<S215>/Unit Conversion'
                                        */
  real_T u_Gain_d;                     /* Expression: 0.5
                                        * Referenced by: '<S218>/1//2'
                                        */
  real_T UnitConversion_Gain_l;        /* Expression: slope
                                        * Referenced by: '<S207>/Unit Conversion'
                                        */
  real_T UnitConversion_Gain_p;        /* Expression: slope
                                        * Referenced by: '<S208>/Unit Conversion'
                                        */
  real_T UnitConversion_Gain_d;        /* Expression: slope
                                        * Referenced by: '<S212>/Unit Conversion'
                                        */
  real_T UnitConversion_Gain_h;        /* Expression: slope
                                        * Referenced by: '<S210>/Unit Conversion'
                                        */
  real_T UnitConversion_Gain_j;        /* Expression: slope
                                        * Referenced by: '<S209>/Unit Conversion'
                                        */
  real_T UnitConversion_Gain_k;        /* Expression: slope
                                        * Referenced by: '<S211>/Unit Conversion'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_constraints_compariso_T {
  const char_T *errorStatus;
  RTWLogInfo *rtwLogInfo;
  RTWSolverInfo solverInfo;

  /*
   * ModelData:
   * The following substructure contains information regarding
   * the data used in the model.
   */
  struct {
    X_constraints_comparison_T *contStates;
    int_T *periodicContStateIndices;
    real_T *periodicContStateRanges;
    real_T *derivs;
    boolean_T *contStateDisabled;
    boolean_T zCCacheNeedsReset;
    boolean_T derivCacheNeedsReset;
    boolean_T blkStateChange;
    real_T odeY[14];
    real_T odeF[4][14];
    ODE4_IntgData intgData;
  } ModelData;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numSampTimes;
  } Sizes;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    boolean_T firstInitCondFlag;
    time_T tFinal;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *t;
    time_T tArray[2];
  } Timing;
};

/* Block parameters (auto storage) */
extern P_constraints_comparison_T constraints_comparison_P;

/* Block signals (auto storage) */
extern B_constraints_comparison_T constraints_comparison_B;

/* Continuous states (auto storage) */
extern X_constraints_comparison_T constraints_comparison_X;

/* Block states (auto storage) */
extern DW_constraints_comparison_T constraints_comparison_DW;

/* Model entry point functions */
extern void constraints_comparison_initialize(void);
extern void constraints_comparison_step(void);
extern void constraints_comparison_terminate(void);

/* Real-time Model object */
extern RT_MODEL_constraints_comparis_T *const constraints_comparison_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'constraints_comparison'
 * '<S1>'   : 'constraints_comparison/MATLAB Function'
 * '<S2>'   : 'constraints_comparison/Subsystem'
 * '<S3>'   : 'constraints_comparison/Subsystem14'
 * '<S4>'   : 'constraints_comparison/Subsystem4'
 * '<S5>'   : 'constraints_comparison/Subsystem5'
 * '<S6>'   : 'constraints_comparison/Subsystem14/Aerodynamics lookup'
 * '<S7>'   : 'constraints_comparison/Subsystem14/Aerodynamics model: Hawk'
 * '<S8>'   : 'constraints_comparison/Subsystem14/Aerodynamics model: compensator'
 * '<S9>'   : 'constraints_comparison/Subsystem14/Aircraft acceleration body axis'
 * '<S10>'  : 'constraints_comparison/Subsystem14/Aircraft attitude relative to arm2'
 * '<S11>'  : 'constraints_comparison/Subsystem14/Aircraft loads for load case loop'
 * '<S12>'  : 'constraints_comparison/Subsystem14/Aircraft_model_friction'
 * '<S13>'  : 'constraints_comparison/Subsystem14/Angle Conversion'
 * '<S14>'  : 'constraints_comparison/Subsystem14/Angle Conversion1'
 * '<S15>'  : 'constraints_comparison/Subsystem14/Angle Conversion10'
 * '<S16>'  : 'constraints_comparison/Subsystem14/Angle Conversion11'
 * '<S17>'  : 'constraints_comparison/Subsystem14/Angle Conversion12'
 * '<S18>'  : 'constraints_comparison/Subsystem14/Angle Conversion13'
 * '<S19>'  : 'constraints_comparison/Subsystem14/Angle Conversion14'
 * '<S20>'  : 'constraints_comparison/Subsystem14/Angle Conversion15'
 * '<S21>'  : 'constraints_comparison/Subsystem14/Angle Conversion16'
 * '<S22>'  : 'constraints_comparison/Subsystem14/Angle Conversion17'
 * '<S23>'  : 'constraints_comparison/Subsystem14/Angle Conversion18'
 * '<S24>'  : 'constraints_comparison/Subsystem14/Angle Conversion19'
 * '<S25>'  : 'constraints_comparison/Subsystem14/Angle Conversion2'
 * '<S26>'  : 'constraints_comparison/Subsystem14/Angle Conversion20'
 * '<S27>'  : 'constraints_comparison/Subsystem14/Angle Conversion21'
 * '<S28>'  : 'constraints_comparison/Subsystem14/Angle Conversion22'
 * '<S29>'  : 'constraints_comparison/Subsystem14/Angle Conversion23'
 * '<S30>'  : 'constraints_comparison/Subsystem14/Angle Conversion24'
 * '<S31>'  : 'constraints_comparison/Subsystem14/Angle Conversion25'
 * '<S32>'  : 'constraints_comparison/Subsystem14/Angle Conversion26'
 * '<S33>'  : 'constraints_comparison/Subsystem14/Angle Conversion27'
 * '<S34>'  : 'constraints_comparison/Subsystem14/Angle Conversion28'
 * '<S35>'  : 'constraints_comparison/Subsystem14/Angle Conversion29'
 * '<S36>'  : 'constraints_comparison/Subsystem14/Angle Conversion3'
 * '<S37>'  : 'constraints_comparison/Subsystem14/Angle Conversion30'
 * '<S38>'  : 'constraints_comparison/Subsystem14/Angle Conversion31'
 * '<S39>'  : 'constraints_comparison/Subsystem14/Angle Conversion32'
 * '<S40>'  : 'constraints_comparison/Subsystem14/Angle Conversion33'
 * '<S41>'  : 'constraints_comparison/Subsystem14/Angle Conversion34'
 * '<S42>'  : 'constraints_comparison/Subsystem14/Angle Conversion35'
 * '<S43>'  : 'constraints_comparison/Subsystem14/Angle Conversion37'
 * '<S44>'  : 'constraints_comparison/Subsystem14/Angle Conversion38'
 * '<S45>'  : 'constraints_comparison/Subsystem14/Angle Conversion39'
 * '<S46>'  : 'constraints_comparison/Subsystem14/Angle Conversion4'
 * '<S47>'  : 'constraints_comparison/Subsystem14/Angle Conversion40'
 * '<S48>'  : 'constraints_comparison/Subsystem14/Angle Conversion6'
 * '<S49>'  : 'constraints_comparison/Subsystem14/Angle Conversion7'
 * '<S50>'  : 'constraints_comparison/Subsystem14/Angle Conversion8'
 * '<S51>'  : 'constraints_comparison/Subsystem14/Angle Conversion9'
 * '<S52>'  : 'constraints_comparison/Subsystem14/Calculating rig pitch acceleration'
 * '<S53>'  : 'constraints_comparison/Subsystem14/Chirp Signal'
 * '<S54>'  : 'constraints_comparison/Subsystem14/Chirp Signal1'
 * '<S55>'  : 'constraints_comparison/Subsystem14/Chirp Signal2'
 * '<S56>'  : 'constraints_comparison/Subsystem14/Compensator friction'
 * '<S57>'  : 'constraints_comparison/Subsystem14/Compensator servo model1'
 * '<S58>'  : 'constraints_comparison/Subsystem14/Compensator servo model2'
 * '<S59>'  : 'constraints_comparison/Subsystem14/Compensator servo model3'
 * '<S60>'  : 'constraints_comparison/Subsystem14/Compensator servo model4'
 * '<S61>'  : 'constraints_comparison/Subsystem14/Equations of Motion'
 * '<S62>'  : 'constraints_comparison/Subsystem14/Extracting aircraft vertical reaction forces1'
 * '<S63>'  : 'constraints_comparison/Subsystem14/Extracting position vector 1'
 * '<S64>'  : 'constraints_comparison/Subsystem14/Extracting position vector 2'
 * '<S65>'  : 'constraints_comparison/Subsystem14/Extracting position vector 2 '
 * '<S66>'  : 'constraints_comparison/Subsystem14/Extracting position vector 3'
 * '<S67>'  : 'constraints_comparison/Subsystem14/Extracting position vector 4'
 * '<S68>'  : 'constraints_comparison/Subsystem14/Extracting position vector 5'
 * '<S69>'  : 'constraints_comparison/Subsystem14/HHIRM'
 * '<S70>'  : 'constraints_comparison/Subsystem14/Hawk servo model'
 * '<S71>'  : 'constraints_comparison/Subsystem14/Load cell reading to aircraft reaction forces'
 * '<S72>'  : 'constraints_comparison/Subsystem14/MATLAB Function1'
 * '<S73>'  : 'constraints_comparison/Subsystem14/MATLAB Function10'
 * '<S74>'  : 'constraints_comparison/Subsystem14/MATLAB Function2'
 * '<S75>'  : 'constraints_comparison/Subsystem14/MATLAB Function3'
 * '<S76>'  : 'constraints_comparison/Subsystem14/MATLAB Function4'
 * '<S77>'  : 'constraints_comparison/Subsystem14/MATLAB Function5'
 * '<S78>'  : 'constraints_comparison/Subsystem14/MATLAB Function6'
 * '<S79>'  : 'constraints_comparison/Subsystem14/MATLAB Function7'
 * '<S80>'  : 'constraints_comparison/Subsystem14/MATLAB Function8'
 * '<S81>'  : 'constraints_comparison/Subsystem14/MATLAB Function9'
 * '<S82>'  : 'constraints_comparison/Subsystem14/Physical deflections to virtual compensator deflections'
 * '<S83>'  : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles'
 * '<S84>'  : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles1'
 * '<S85>'  : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles2'
 * '<S86>'  : 'constraints_comparison/Subsystem14/Signal Builder'
 * '<S87>'  : 'constraints_comparison/Subsystem14/Subsystem'
 * '<S88>'  : 'constraints_comparison/Subsystem14/Subsystem1'
 * '<S89>'  : 'constraints_comparison/Subsystem14/Subsystem10'
 * '<S90>'  : 'constraints_comparison/Subsystem14/Subsystem11'
 * '<S91>'  : 'constraints_comparison/Subsystem14/Subsystem12'
 * '<S92>'  : 'constraints_comparison/Subsystem14/Subsystem13'
 * '<S93>'  : 'constraints_comparison/Subsystem14/Subsystem2'
 * '<S94>'  : 'constraints_comparison/Subsystem14/Subsystem3'
 * '<S95>'  : 'constraints_comparison/Subsystem14/Subsystem4'
 * '<S96>'  : 'constraints_comparison/Subsystem14/Subsystem5'
 * '<S97>'  : 'constraints_comparison/Subsystem14/Subsystem6'
 * '<S98>'  : 'constraints_comparison/Subsystem14/Subsystem7'
 * '<S99>'  : 'constraints_comparison/Subsystem14/Subsystem8'
 * '<S100>' : 'constraints_comparison/Subsystem14/Subsystem9'
 * '<S101>' : 'constraints_comparison/Subsystem14/Virtual compensator deflections to physical deflections'
 * '<S102>' : 'constraints_comparison/Subsystem14/Wind axes angular rates calculation'
 * '<S103>' : 'constraints_comparison/Subsystem14/Compensator servo model1/kinematic'
 * '<S104>' : 'constraints_comparison/Subsystem14/Compensator servo model1/kinematic/Angle Conversion'
 * '<S105>' : 'constraints_comparison/Subsystem14/Compensator servo model1/kinematic/Compare To Zero'
 * '<S106>' : 'constraints_comparison/Subsystem14/Compensator servo model1/kinematic/Compare To Zero1'
 * '<S107>' : 'constraints_comparison/Subsystem14/Compensator servo model1/kinematic/Compare To Zero2'
 * '<S108>' : 'constraints_comparison/Subsystem14/Compensator servo model1/kinematic/Compare To Zero3'
 * '<S109>' : 'constraints_comparison/Subsystem14/Compensator servo model2/kinematic'
 * '<S110>' : 'constraints_comparison/Subsystem14/Compensator servo model2/kinematic/Angle Conversion'
 * '<S111>' : 'constraints_comparison/Subsystem14/Compensator servo model2/kinematic/Compare To Zero'
 * '<S112>' : 'constraints_comparison/Subsystem14/Compensator servo model2/kinematic/Compare To Zero1'
 * '<S113>' : 'constraints_comparison/Subsystem14/Compensator servo model2/kinematic/Compare To Zero2'
 * '<S114>' : 'constraints_comparison/Subsystem14/Compensator servo model2/kinematic/Compare To Zero3'
 * '<S115>' : 'constraints_comparison/Subsystem14/Compensator servo model3/kinematic'
 * '<S116>' : 'constraints_comparison/Subsystem14/Compensator servo model3/kinematic/Angle Conversion'
 * '<S117>' : 'constraints_comparison/Subsystem14/Compensator servo model3/kinematic/Compare To Zero'
 * '<S118>' : 'constraints_comparison/Subsystem14/Compensator servo model3/kinematic/Compare To Zero1'
 * '<S119>' : 'constraints_comparison/Subsystem14/Compensator servo model3/kinematic/Compare To Zero2'
 * '<S120>' : 'constraints_comparison/Subsystem14/Compensator servo model3/kinematic/Compare To Zero3'
 * '<S121>' : 'constraints_comparison/Subsystem14/Compensator servo model4/kinematic'
 * '<S122>' : 'constraints_comparison/Subsystem14/Compensator servo model4/kinematic/Angle Conversion'
 * '<S123>' : 'constraints_comparison/Subsystem14/Compensator servo model4/kinematic/Compare To Zero'
 * '<S124>' : 'constraints_comparison/Subsystem14/Compensator servo model4/kinematic/Compare To Zero1'
 * '<S125>' : 'constraints_comparison/Subsystem14/Compensator servo model4/kinematic/Compare To Zero2'
 * '<S126>' : 'constraints_comparison/Subsystem14/Compensator servo model4/kinematic/Compare To Zero3'
 * '<S127>' : 'constraints_comparison/Subsystem14/Extracting position vector 1/MATLAB Function'
 * '<S128>' : 'constraints_comparison/Subsystem14/Extracting position vector 2/MATLAB Function'
 * '<S129>' : 'constraints_comparison/Subsystem14/Extracting position vector 2 /MATLAB Function'
 * '<S130>' : 'constraints_comparison/Subsystem14/Extracting position vector 3/MATLAB Function'
 * '<S131>' : 'constraints_comparison/Subsystem14/Extracting position vector 4/MATLAB Function'
 * '<S132>' : 'constraints_comparison/Subsystem14/Extracting position vector 5/MATLAB Function'
 * '<S133>' : 'constraints_comparison/Subsystem14/Hawk servo model/kinematic'
 * '<S134>' : 'constraints_comparison/Subsystem14/Hawk servo model/kinematic/Angle Conversion'
 * '<S135>' : 'constraints_comparison/Subsystem14/Hawk servo model/kinematic/Compare To Zero'
 * '<S136>' : 'constraints_comparison/Subsystem14/Hawk servo model/kinematic/Compare To Zero1'
 * '<S137>' : 'constraints_comparison/Subsystem14/Hawk servo model/kinematic/Compare To Zero2'
 * '<S138>' : 'constraints_comparison/Subsystem14/Hawk servo model/kinematic/Compare To Zero3'
 * '<S139>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles/Quaternion Normalize'
 * '<S140>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus'
 * '<S141>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus/Quaternion Norm'
 * '<S142>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles1/Quaternion Normalize'
 * '<S143>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles1/Quaternion Normalize/Quaternion Modulus'
 * '<S144>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles1/Quaternion Normalize/Quaternion Modulus/Quaternion Norm'
 * '<S145>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles2/Quaternion Normalize'
 * '<S146>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles2/Quaternion Normalize/Quaternion Modulus'
 * '<S147>' : 'constraints_comparison/Subsystem14/Quaternions to Rotation Angles2/Quaternion Normalize/Quaternion Modulus/Quaternion Norm'
 * '<S148>' : 'constraints_comparison/Subsystem14/Subsystem/Angle Conversion'
 * '<S149>' : 'constraints_comparison/Subsystem14/Subsystem/Angle Conversion1'
 * '<S150>' : 'constraints_comparison/Subsystem14/Subsystem/Angle Conversion2'
 * '<S151>' : 'constraints_comparison/Subsystem14/Subsystem/Angle Conversion3'
 * '<S152>' : 'constraints_comparison/Subsystem14/Subsystem/MATLAB Function'
 * '<S153>' : 'constraints_comparison/Subsystem14/Subsystem/Rotation Angles to Quaternions'
 * '<S154>' : 'constraints_comparison/Subsystem14/Subsystem1/Angle Conversion'
 * '<S155>' : 'constraints_comparison/Subsystem14/Subsystem1/MATLAB Function'
 * '<S156>' : 'constraints_comparison/Subsystem14/Subsystem1/Quaternions to Rotation Angles'
 * '<S157>' : 'constraints_comparison/Subsystem14/Subsystem1/Rotation Angles to Quaternions'
 * '<S158>' : 'constraints_comparison/Subsystem14/Subsystem1/Quaternions to Rotation Angles/Quaternion Normalize'
 * '<S159>' : 'constraints_comparison/Subsystem14/Subsystem1/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus'
 * '<S160>' : 'constraints_comparison/Subsystem14/Subsystem1/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus/Quaternion Norm'
 * '<S161>' : 'constraints_comparison/Subsystem14/Subsystem10/Angle Conversion1'
 * '<S162>' : 'constraints_comparison/Subsystem14/Subsystem10/Angle Conversion2'
 * '<S163>' : 'constraints_comparison/Subsystem14/Subsystem10/Angle Conversion3'
 * '<S164>' : 'constraints_comparison/Subsystem14/Subsystem10/MATLAB Function'
 * '<S165>' : 'constraints_comparison/Subsystem14/Subsystem11/Angle Conversion'
 * '<S166>' : 'constraints_comparison/Subsystem14/Subsystem11/MATLAB Function'
 * '<S167>' : 'constraints_comparison/Subsystem14/Subsystem11/Rotation Angles to Quaternions'
 * '<S168>' : 'constraints_comparison/Subsystem14/Subsystem12/Angle Conversion1'
 * '<S169>' : 'constraints_comparison/Subsystem14/Subsystem12/Angle Conversion2'
 * '<S170>' : 'constraints_comparison/Subsystem14/Subsystem12/Angle Conversion3'
 * '<S171>' : 'constraints_comparison/Subsystem14/Subsystem12/MATLAB Function'
 * '<S172>' : 'constraints_comparison/Subsystem14/Subsystem13/Angle Conversion'
 * '<S173>' : 'constraints_comparison/Subsystem14/Subsystem13/MATLAB Function'
 * '<S174>' : 'constraints_comparison/Subsystem14/Subsystem13/Rotation Angles to Quaternions'
 * '<S175>' : 'constraints_comparison/Subsystem14/Subsystem2/Angle Conversion'
 * '<S176>' : 'constraints_comparison/Subsystem14/Subsystem2/Angle Conversion1'
 * '<S177>' : 'constraints_comparison/Subsystem14/Subsystem2/Angle Conversion2'
 * '<S178>' : 'constraints_comparison/Subsystem14/Subsystem2/Angle Conversion3'
 * '<S179>' : 'constraints_comparison/Subsystem14/Subsystem2/MATLAB Function'
 * '<S180>' : 'constraints_comparison/Subsystem14/Subsystem2/Rotation Angles to Quaternions'
 * '<S181>' : 'constraints_comparison/Subsystem14/Subsystem3/Angle Conversion'
 * '<S182>' : 'constraints_comparison/Subsystem14/Subsystem3/MATLAB Function'
 * '<S183>' : 'constraints_comparison/Subsystem14/Subsystem3/Rotation Angles to Quaternions'
 * '<S184>' : 'constraints_comparison/Subsystem14/Subsystem4/Angle Conversion'
 * '<S185>' : 'constraints_comparison/Subsystem14/Subsystem4/Angle Conversion1'
 * '<S186>' : 'constraints_comparison/Subsystem14/Subsystem4/Angle Conversion2'
 * '<S187>' : 'constraints_comparison/Subsystem14/Subsystem4/Angle Conversion3'
 * '<S188>' : 'constraints_comparison/Subsystem14/Subsystem4/Angle Conversion4'
 * '<S189>' : 'constraints_comparison/Subsystem14/Subsystem4/Angle Conversion5'
 * '<S190>' : 'constraints_comparison/Subsystem14/Subsystem4/Angle Conversion6'
 * '<S191>' : 'constraints_comparison/Subsystem14/Subsystem4/MATLAB Function'
 * '<S192>' : 'constraints_comparison/Subsystem14/Subsystem4/Rotation Angles to Quaternions'
 * '<S193>' : 'constraints_comparison/Subsystem14/Subsystem5/Angle Conversion'
 * '<S194>' : 'constraints_comparison/Subsystem14/Subsystem5/Angle Conversion1'
 * '<S195>' : 'constraints_comparison/Subsystem14/Subsystem5/MATLAB Function'
 * '<S196>' : 'constraints_comparison/Subsystem14/Subsystem5/Rotation Angles to Quaternions'
 * '<S197>' : 'constraints_comparison/Subsystem14/Subsystem5/Rotation Angles to Quaternions1'
 * '<S198>' : 'constraints_comparison/Subsystem14/Subsystem6/Compare To Zero'
 * '<S199>' : 'constraints_comparison/Subsystem14/Subsystem6/Compare To Zero1'
 * '<S200>' : 'constraints_comparison/Subsystem14/Subsystem6/Compare To Zero2'
 * '<S201>' : 'constraints_comparison/Subsystem14/Subsystem7/Compare To Zero'
 * '<S202>' : 'constraints_comparison/Subsystem14/Subsystem7/Compare To Zero1'
 * '<S203>' : 'constraints_comparison/Subsystem14/Subsystem7/Compare To Zero2'
 * '<S204>' : 'constraints_comparison/Subsystem14/Subsystem9/Angle Conversion'
 * '<S205>' : 'constraints_comparison/Subsystem14/Subsystem9/Rotation Angles to Quaternions'
 * '<S206>' : 'constraints_comparison/Subsystem4/Angle Conversion'
 * '<S207>' : 'constraints_comparison/Subsystem4/Angle Conversion1'
 * '<S208>' : 'constraints_comparison/Subsystem4/Angle Conversion2'
 * '<S209>' : 'constraints_comparison/Subsystem4/Angle Conversion3'
 * '<S210>' : 'constraints_comparison/Subsystem4/Angle Conversion4'
 * '<S211>' : 'constraints_comparison/Subsystem4/Angle Conversion5'
 * '<S212>' : 'constraints_comparison/Subsystem4/Angle Conversion6'
 * '<S213>' : 'constraints_comparison/Subsystem4/MATLAB Function'
 * '<S214>' : 'constraints_comparison/Subsystem4/Rotation Angles to Quaternions'
 * '<S215>' : 'constraints_comparison/Subsystem5/Angle Conversion'
 * '<S216>' : 'constraints_comparison/Subsystem5/Angle Conversion1'
 * '<S217>' : 'constraints_comparison/Subsystem5/MATLAB Function'
 * '<S218>' : 'constraints_comparison/Subsystem5/Rotation Angles to Quaternions'
 * '<S219>' : 'constraints_comparison/Subsystem5/Rotation Angles to Quaternions1'
 */
#endif                                 /* RTW_HEADER_constraints_comparison_h_ */
