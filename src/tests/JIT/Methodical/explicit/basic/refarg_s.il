// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.



.assembly extern mscorlib { }
.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly 'refarg_s'// as "refarg_s"
{

  //  .custom instance void ['mscorlib']System.Diagnostics.DebuggableAttribute::.ctor(bool,
  //                                                                                  bool) = ( 01 00 00 01 00 00 ) 
  
  
}
.assembly extern xunit.core {}
// MVID: {003C53D6-66A7-45B4-8632-F678BD70244A}
.namespace Test
{
  .class private auto ansi AA extends ['mscorlib']System.Object
  {
    .field family wchar pad1
    .field public class System.String mm
    .field private class Test.AA self
    .method public hidebysig specialname rtspecialname 
            instance void .ctor() il managed
    {
      // Code size       40 (0x28)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  ldc.i4.s   122
      IL_0003:  stfld      wchar Test.AA::pad1
      IL_0008:  ldarg.0
      IL_0009:  ldstr      "monolight"
      IL_000e:  stfld      class System.String Test.AA::mm
      IL_0013:  ldarg.0
      IL_0014:  ldnull
      IL_0015:  stfld      class Test.AA Test.AA::self
      IL_001a:  ldarg.0
      IL_001b:  call       instance void ['mscorlib']System.Object::.ctor()
      IL_0020:  ldarg.0
      IL_0021:  ldarg.0
      IL_0022:  stfld      class Test.AA Test.AA::self
      IL_0027:  ret
    } // end of method 'AA::.ctor'

    .method family hidebysig virtual instance void
            Finalize() il managed
    {
      // Code size       77 (0x4d)
      .maxstack  2
      IL_0000:  ldarg.0
      IL_0001:  ldfld      wchar Test.AA::pad1
      IL_0006:  ldc.i4.s   122
      IL_0008:  bne.un.s   IL_001c

      IL_000a:  ldarg.0
      IL_000b:  ldfld      class System.String Test.AA::mm
      IL_0010:  ldstr      "monolight"
      IL_0015:  call       bool ['mscorlib']System.String::Equals(class System.String,
                                                                  class System.String)
      IL_001a:  brtrue.s   IL_0022

      IL_001c:  newobj     instance void ['mscorlib']System.Exception::.ctor()
      IL_0021:  throw

      IL_0022:  ldarg.0
      IL_0023:  ldfld      class Test.AA Test.AA::self
      IL_0028:  brfalse.s  IL_004c

      IL_002a:  ldarg.0
      IL_002b:  ldfld      wchar Test.AA::pad1
      IL_0030:  ldc.i4.s   122
      IL_0032:  bne.un.s   IL_0046

      IL_0034:  ldarg.0
      IL_0035:  ldfld      class System.String Test.AA::mm
      IL_003a:  ldstr      "monolight"
      IL_003f:  call       bool ['mscorlib']System.String::Equals(class System.String,
                                                                  class System.String)
      IL_0044:  brtrue.s   IL_004c

      IL_0046:  newobj     instance void ['mscorlib']System.Exception::.ctor()
      IL_004b:  throw

      IL_004c:  ret
    } // end of method 'AA::Finalize'

  } // end of class 'AA'

  .class private auto ansi App extends ['mscorlib']System.Object
  {
    .field private static class Test.AA s_aa
    .method private hidebysig static void
            Litter() il managed
    {
      // Code size       38 (0x26)
      .maxstack  2
      .locals (int32 V_0,
               int32[] V_1)
      IL_0000:  call       void ['mscorlib']System.GC::Collect()
      IL_0005:  ldc.i4.0
      IL_0006:  stloc.0
      IL_0007:  br.s       IL_0018

      IL_0009:  ldc.i4     0x3e8
      IL_000e:  newarr     ['mscorlib']System.Int32
      IL_0013:  stloc.1
      IL_0014:  ldloc.0
      IL_0015:  ldc.i4.1
      IL_0016:  add
      IL_0017:  stloc.0
      IL_0018:  ldloc.0
      IL_0019:  ldc.i4     0x3e8
      IL_001e:  blt.s      IL_0009

      IL_0020:  call       void ['mscorlib']System.GC::Collect()
      IL_0025:  ret
    } // end of method 'App::Litter'

    .method private hidebysig static int32 
            Test(class System.String& n) il managed
    {
      // Code size       55 (0x37)
      .maxstack  2
      .locals (int32 V_0)
      IL_0000:  ldnull
      IL_0001:  stsfld     class Test.AA Test.App::s_aa
      IL_0006:  call       void Test.App::Litter()
      IL_000b:  ldarg.0
      IL_000c:  ldind.ref
      IL_000d:  ldstr      "monolight"
      IL_0012:  call       bool ['mscorlib']System.String::Equals(class System.String,
                                                                  class System.String)
      IL_0017:  brtrue.s   IL_0027

      IL_0019:  ldstr      "*** failed ***"
      IL_001e:  call       void [System.Console]System.Console::WriteLine(class System.String)
      IL_0023:  ldc.i4.1
      IL_0024:  stloc.0
      IL_0025:  br.s       IL_0035

      IL_0027:  ldstr      "*** passed ***"
      IL_002c:  call       void [System.Console]System.Console::WriteLine(class System.String)
      IL_0031:  ldc.i4    0x64
      IL_0032:  stloc.0
      IL_0033:  br.s       IL_0035

      IL_0035:  ldloc.0
      IL_0036:  ret
    } // end of method 'App::Test'

    .method private hidebysig static int32
            Main() il managed
    {
      .custom instance void [xunit.core]Xunit.FactAttribute::.ctor() = (
          01 00 00 00
      )
      .entrypoint
      // Code size       32 (0x20)
      .maxstack  1
      .locals (int32 V_0,
               int32 V_1)
      IL_0000:  ldsfld     class Test.AA Test.App::s_aa
      IL_0005:  ldflda     class System.String Test.AA::mm
      IL_000a:  call       int32 Test.App::Test(class System.String&)
      IL_000f:  stloc.0
      IL_0010:  call       void ['mscorlib']System.GC::Collect()
      IL_0015:  call       void ['mscorlib']System.GC::WaitForPendingFinalizers()
      IL_001a:  ldloc.0
      IL_001b:  stloc.1
      IL_001c:  br.s       IL_001e

      IL_001e:  ldloc.1
      IL_001f:  ret
    } // end of method 'App::Main'

    .method public hidebysig specialname rtspecialname static 
            void .cctor() il managed
    {
      // Code size       11 (0xb)
      .maxstack  8
      IL_0000:  newobj     instance void Test.AA::.ctor()
      IL_0005:  stsfld     class Test.AA Test.App::s_aa
      IL_000a:  ret
    } // end of method 'App::.cctor'

    .method public hidebysig specialname rtspecialname 
            instance void .ctor() il managed
    {
      // Code size       7 (0x7)
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void ['mscorlib']System.Object::.ctor()
      IL_0006:  ret
    } // end of method 'App::.ctor'

  } // end of class 'App'

} // end of namespace 'Test'

//*********** DISASSEMBLY COMPLETE ***********************
