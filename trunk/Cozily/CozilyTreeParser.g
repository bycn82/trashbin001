tree grammar CozilyTreeParser;
options {
tokenVocab=Cozily; 
backtrack = true; 
memoize = true;
ASTLabelType = CommonTree;
}
@header {
package com.cozilyworks.cozily.parser;
import com.cozilyworks.cozily.codedom.*;
import com.cozilyworks.cozily.codedom.impl.*;
}

//rules begin

fileDeclaration returns[FileDeclaration rtn]
@init{rtn=new FileDeclaration();}
:^(FILEDECLARATION0{rtn.coz=0;} 	((x0=annotations{rtn.setAnnotations(x0);})? (x1=packageDeclaration{rtn.setPackageDeclaration(x1);}))? (x2=importDeclaration{rtn.addImportDeclaration(x2);})* (x3=typeDeclaration{rtn.addTypeDeclaration(x3);})*)
;

packageDeclaration returns[PackageDeclaration rtn]
@init{rtn=new PackageDeclaration();}
:^(PACKAGEDECLARATION0{rtn.coz=0;}     (x0=qualifiedName{rtn.setQualifiedName(x0);}))
;

importDeclaration returns[ImportDeclaration rtn]
@init{rtn=new ImportDeclaration();}
:^(IMPORTDECLARATION0{rtn.coz=0;}     (x0=STATIC{rtn.setSTATIC($x0.text);})? (x1=qualifiedName{rtn.setQualifiedName(x1);}) (x2=DOTSTAR{rtn.setDOTSTAR($x2.text);})?)
;

typeDeclaration returns[TypeDeclaration rtn]
@init{rtn=new TypeDeclaration();}
:^(TYPEDECLARATION0{rtn.coz=0;}    (x0=classOrInterfaceDeclaration{rtn.setClassOrInterfaceDeclaration(x0);}))
;

classOrInterfaceDeclaration returns[ClassOrInterfaceDeclaration rtn]
@init{rtn=new ClassOrInterfaceDeclaration();}
:^(CLASSORINTERFACEDECLARATION0{rtn.coz=0;}    (x0=classDeclaration{rtn.setClassDeclaration(x0);}))
|^(CLASSORINTERFACEDECLARATION1{rtn.coz=1;}    (x1=interfaceDeclaration{rtn.setInterfaceDeclaration(x1);}))
;

modifiers returns[Modifiers rtn]
@init{rtn=new Modifiers();}
:^(MODIFIERS0{rtn.coz=0;}  	(x0=modifier{rtn.addModifier(x0);})*)
;

modifier returns[Modifier rtn]
@init{rtn=new Modifier();}
:^(MODIFIER0{rtn.coz=0;} 	 (x0=annotation{rtn.setAnnotation(x0);}))
|^(MODIFIER1{rtn.coz=1;}    (x1=PUBLIC{rtn.setPUBLIC($x1.text);}))
|^(MODIFIER2{rtn.coz=2;}    (x2=PROTECTED{rtn.setPROTECTED($x2.text);}))
|^(MODIFIER3{rtn.coz=3;}    (x3=PRIVATE{rtn.setPRIVATE($x3.text);}))
|^(MODIFIER4{rtn.coz=4;}    (x4=STATIC{rtn.setSTATIC($x4.text);}))
|^(MODIFIER5{rtn.coz=5;}    (x5=ABSTRACT{rtn.setABSTRACT($x5.text);}))
|^(MODIFIER6{rtn.coz=6;}    (x6=FINAL{rtn.setFINAL($x6.text);}))
|^(MODIFIER7{rtn.coz=7;}    (x7=NATIVE{rtn.setNATIVE($x7.text);}))
|^(MODIFIER8{rtn.coz=8;}    (x8=SYNCHRONIZED{rtn.setSYNCHRONIZED($x8.text);}))
|^(MODIFIER9{rtn.coz=9;}    (x9=TRANSIENT{rtn.setTRANSIENT($x9.text);}))
|^(MODIFIER10{rtn.coz=10;}    (x10=VOLATILE{rtn.setVOLATILE($x10.text);}))
|^(MODIFIER11{rtn.coz=11;}    (x11=STRICTFP{rtn.setSTRICTFP($x11.text);}))
;

variableModifiers returns[VariableModifiers rtn]
@init{rtn=new VariableModifiers();}
:^(VARIABLEMODIFIERS0{rtn.coz=0;}    (x0=variableModifier{rtn.addVariableModifier(x0);})*)
;

variableModifier returns[VariableModifier rtn]
@init{rtn=new VariableModifier();}
:^(VARIABLEMODIFIER0{rtn.coz=0;} 	(x0=annotation{rtn.setAnnotation(x0);}))
|^(VARIABLEMODIFIER1{rtn.coz=1;} 	(x1=FINAL{rtn.setFINAL($x1.text);}))
;

classDeclaration returns[ClassDeclaration rtn]
@init{rtn=new ClassDeclaration();}
:^(CLASSDECLARATION0{rtn.coz=0;}    (x0=normalClassDeclaration{rtn.setNormalClassDeclaration(x0);}))
|^(CLASSDECLARATION1{rtn.coz=1;}    (x1=enumDeclaration{rtn.setEnumDeclaration(x1);}))
;

normalClassDeclaration returns[NormalClassDeclaration rtn]
@init{rtn=new NormalClassDeclaration();}
:^(NORMALCLASSDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);})   (x1=IDENTIFIER{rtn.setIDENTIFIER($x1.text);}) (x2=typeParameters{rtn.setTypeParameters(x2);})? ( (x3=type{rtn.setType(x3);}))? ( (x4=typeList{rtn.setTypeList(x4);}))? (x5=classBody{rtn.setClassBody(x5);}))
;

typeParameters returns[TypeParameters rtn]
@init{rtn=new TypeParameters();}
:^(TYPEPARAMETERS0{rtn.coz=0;}     (x0=typeParameter{rtn.setTypeParameter(x0);}) ( (x1=typeParameter{rtn.addTypeParameter(x1);}))*)
;

typeParameter returns[TypeParameter rtn]
@init{rtn=new TypeParameter();}
:^(TYPEPARAMETER0{rtn.coz=0;}    (x0=IDENTIFIER{rtn.setIDENTIFIER($x0.text);}) ( (x1=typeBound{rtn.setTypeBound(x1);}))?)
;

typeBound returns[TypeBound rtn]
@init{rtn=new TypeBound();}
:^(TYPEBOUND0{rtn.coz=0;}    (x0=type{rtn.setType(x0);}) ( (x1=type{rtn.addType(x1);}))*)
;

enumDeclaration returns[EnumDeclaration rtn]
@init{rtn=new EnumDeclaration();}
:^(ENUMDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);})  (x1=IDENTIFIER{rtn.setIDENTIFIER($x1.text);}) ( (x2=typeList{rtn.setTypeList(x2);}))? (x3=enumBody{rtn.setEnumBody(x3);}))
;

enumBody returns[EnumBody rtn]
@init{rtn=new EnumBody();}
:^(ENUMBODY0{rtn.coz=0;}     (x0=enumConstants{rtn.setEnumConstants(x0);})? (x1=COMMA{rtn.setCOMMA($x1.text);})? ((x2=enumBodyDeclarations{rtn.setEnumBodyDeclarations(x2);}))?)
;

enumConstants returns[EnumConstants rtn]
@init{rtn=new EnumConstants();}
:^(ENUMCONSTANTS0{rtn.coz=0;}    (x0=enumConstant{rtn.setEnumConstant(x0);}) ( (x1=enumConstant{rtn.addEnumConstant(x1);}))*)
;

enumConstant returns[EnumConstant rtn]
@init{rtn=new EnumConstant();}
:^(ENUMCONSTANT0{rtn.coz=0;}    (x0=annotations{rtn.setAnnotations(x0);})? (x1=IDENTIFIER{rtn.setIDENTIFIER($x1.text);}) (x2=arguments{rtn.setArguments(x2);})? (x3=classBody{rtn.setClassBody(x3);})?)
;

enumBodyDeclarations returns[EnumBodyDeclarations rtn]
@init{rtn=new EnumBodyDeclarations();}
:^(ENUMBODYDECLARATIONS0{rtn.coz=0;}     (x0=classBodyDeclaration{rtn.addClassBodyDeclaration(x0);})*)
;

interfaceDeclaration returns[InterfaceDeclaration rtn]
@init{rtn=new InterfaceDeclaration();}
:^(INTERFACEDECLARATION0{rtn.coz=0;}    (x0=normalInterfaceDeclaration{rtn.setNormalInterfaceDeclaration(x0);}))
|^(INTERFACEDECLARATION1{rtn.coz=1;}    (x1=annotationTypeDeclaration{rtn.setAnnotationTypeDeclaration(x1);}))
;

normalInterfaceDeclaration returns[NormalInterfaceDeclaration rtn]
@init{rtn=new NormalInterfaceDeclaration();}
:^(NORMALINTERFACEDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);})  (x1=IDENTIFIER{rtn.setIDENTIFIER($x1.text);}) (x2=typeParameters{rtn.setTypeParameters(x2);})?  ( (x3=typeList{rtn.setTypeList(x3);}))? (x4=interfaceBody{rtn.setInterfaceBody(x4);}))
;

typeList returns[TypeList rtn]
@init{rtn=new TypeList();}
:^(TYPELIST0{rtn.coz=0;}    (x0=type{rtn.setType(x0);}) ( (x1=type{rtn.addType(x1);}))*)
;

classBody returns[ClassBody rtn]
@init{rtn=new ClassBody();}
:^(CLASSBODY0{rtn.coz=0;}     (x0=classBodyDeclaration{rtn.addClassBodyDeclaration(x0);})*)
;

interfaceBody returns[InterfaceBody rtn]
@init{rtn=new InterfaceBody();}
:^(INTERFACEBODY0{rtn.coz=0;}     (x0=interfaceBodyDeclaration{rtn.addInterfaceBodyDeclaration(x0);})*)
;

classBodyDeclaration returns[ClassBodyDeclaration rtn]
@init{rtn=new ClassBodyDeclaration();}
:^(CLASSBODYDECLARATION0{rtn.coz=0;} )
|^(CLASSBODYDECLARATION1{rtn.coz=1;}    (x0=STATIC{rtn.setSTATIC($x0.text);})? (x1=block{rtn.setBlock(x1);}))
|^(CLASSBODYDECLARATION2{rtn.coz=2;}    (x2=memberDecl{rtn.setMemberDecl(x2);}))
;

memberDecl returns[MemberDecl rtn]
@init{rtn=new MemberDecl();}
:^(MEMBERDECL0{rtn.coz=0;}     (x0=fieldDeclaration{rtn.setFieldDeclaration(x0);}))
|^(MEMBERDECL1{rtn.coz=1;}     (x1=methodDeclaration{rtn.setMethodDeclaration(x1);}))
|^(MEMBERDECL2{rtn.coz=2;}     (x2=classDeclaration{rtn.setClassDeclaration(x2);}))
|^(MEMBERDECL3{rtn.coz=3;}     (x3=interfaceDeclaration{rtn.setInterfaceDeclaration(x3);}))
;

methodDeclaration returns[MethodDeclaration rtn]
@init{rtn=new MethodDeclaration();}
:^(METHODDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);}) (x1=typeParameters{rtn.setTypeParameters(x1);})? (x2=IDENTIFIER{rtn.setIDENTIFIER($x2.text);}) (x3=formalParameters{rtn.setFormalParameters(x3);}) ( (x4=qualifiedNameList{rtn.setQualifiedNameList(x4);}))?  (x5=explicitConstructorInvocation{rtn.setExplicitConstructorInvocation(x5);})? (x6=blockStatement{rtn.addBlockStatement(x6);})*)
|^(METHODDECLARATION1{rtn.coz=1;}    (x7=modifiers{rtn.setModifiers(x7);}) (x8=typeParameters{rtn.setTypeParameters(x8);})? (x9=returnType{rtn.setReturnType(x9);}) (x10=IDENTIFIER{rtn.setIDENTIFIER($x10.text);}) (x11=formalParameters{rtn.setFormalParameters(x11);}) (x12=BRACKETS{rtn.addBRACKETS($x12.text);})* ( (x13=qualifiedNameList{rtn.setQualifiedNameList(x13);}))? (x14=blockOrComma{rtn.setBlockOrComma(x14);}))
;

blockOrComma returns[BlockOrComma rtn]
@init{rtn=new BlockOrComma();}
:^(BLOCKORCOMMA0{rtn.coz=0;} 	(x0=block{rtn.setBlock(x0);}))
|^(BLOCKORCOMMA1{rtn.coz=1;}    (x1=SEMI{rtn.setSEMI($x1.text);}))
;

returnType returns[ReturnType rtn]
@init{rtn=new ReturnType();}
:^(RETURNTYPE0{rtn.coz=0;} 	(x0=type{rtn.setType(x0);}))
|^(RETURNTYPE1{rtn.coz=1;} 	(x1=VOID{rtn.setVOID($x1.text);}))
;

fieldDeclaration returns[FieldDeclaration rtn]
@init{rtn=new FieldDeclaration();}
:^(FIELDDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);}) (x1=type{rtn.setType(x1);}) (x2=variableDeclarator{rtn.setVariableDeclarator(x2);}) ( (x3=variableDeclarator{rtn.addVariableDeclarator(x3);}))*)
;

variableDeclarator returns[VariableDeclarator rtn]
@init{rtn=new VariableDeclarator();}
:^(VARIABLEDECLARATOR0{rtn.coz=0;}    (x0=IDENTIFIER{rtn.setIDENTIFIER($x0.text);}) (x1=BRACKETS{rtn.addBRACKETS($x1.text);})* ( (x2=variableInitializer{rtn.setVariableInitializer(x2);}))?)
;

interfaceBodyDeclaration returns[InterfaceBodyDeclaration rtn]
@init{rtn=new InterfaceBodyDeclaration();}
:^(INTERFACEBODYDECLARATION0{rtn.coz=0;}    (x0=interfaceFieldDeclaration{rtn.setInterfaceFieldDeclaration(x0);}))
|^(INTERFACEBODYDECLARATION1{rtn.coz=1;}    (x1=interfaceMethodDeclaration{rtn.setInterfaceMethodDeclaration(x1);}))
|^(INTERFACEBODYDECLARATION2{rtn.coz=2;}    (x2=interfaceDeclaration{rtn.setInterfaceDeclaration(x2);}))
|^(INTERFACEBODYDECLARATION3{rtn.coz=3;}    (x3=classDeclaration{rtn.setClassDeclaration(x3);}))
|^(INTERFACEBODYDECLARATION4{rtn.coz=4;}    (x4=SEMI{rtn.setSEMI($x4.text);}))
;

interfaceMethodDeclaration returns[InterfaceMethodDeclaration rtn]
@init{rtn=new InterfaceMethodDeclaration();}
:^(INTERFACEMETHODDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);}) (x1=typeParameters{rtn.setTypeParameters(x1);})? (x2=returnType{rtn.setReturnType(x2);}) (x3=IDENTIFIER{rtn.setIDENTIFIER($x3.text);}) (x4=formalParameters{rtn.setFormalParameters(x4);}) (x5=BRACKETS{rtn.addBRACKETS($x5.text);})* ( (x6=qualifiedNameList{rtn.setQualifiedNameList(x6);}))?)
;

interfaceFieldDeclaration returns[InterfaceFieldDeclaration rtn]
@init{rtn=new InterfaceFieldDeclaration();}
:^(INTERFACEFIELDDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);}) (x1=type{rtn.setType(x1);}) (x2=variableDeclarator{rtn.setVariableDeclarator(x2);}) ( (x3=variableDeclarator{rtn.addVariableDeclarator(x3);}))*)
;

type returns[Type rtn]
@init{rtn=new Type();}
:^(TYPE0{rtn.coz=0;}    (x0=classOrInterfaceType{rtn.setClassOrInterfaceType(x0);}) (x1=BRACKETS{rtn.addBRACKETS($x1.text);})*)
|^(TYPE1{rtn.coz=1;}    (x2=primitiveType{rtn.setPrimitiveType(x2);}) (x3=BRACKETS{rtn.addBRACKETS($x3.text);})*)
;

classOrInterfaceType returns[ClassOrInterfaceType rtn]
@init{rtn=new ClassOrInterfaceType();}
:^(CLASSORINTERFACETYPE0{rtn.coz=0;}    (x0=IDENTIFIER{rtn.setIDENTIFIER($x0.text);}) (x1=typeArguments{rtn.setTypeArguments(x1);})? ( (x2=IDENTIFIER{rtn.addIDENTIFIER($x2.text);}) (x3=typeArguments{rtn.addTypeArguments(x3);})? )*)
;

primitiveType returns[PrimitiveType rtn]
@init{rtn=new PrimitiveType();}
:^(PRIMITIVETYPE0{rtn.coz=0;}    (x0=BOOLEAN{rtn.setBOOLEAN($x0.text);}))
|^(PRIMITIVETYPE1{rtn.coz=1;}    (x1=CHAR{rtn.setCHAR($x1.text);}))
|^(PRIMITIVETYPE2{rtn.coz=2;}    (x2=BYTE{rtn.setBYTE($x2.text);}))
|^(PRIMITIVETYPE3{rtn.coz=3;}    (x3=SHORT{rtn.setSHORT($x3.text);}))
|^(PRIMITIVETYPE4{rtn.coz=4;}    (x4=INT{rtn.setINT($x4.text);}))
|^(PRIMITIVETYPE5{rtn.coz=5;}    (x5=LONG{rtn.setLONG($x5.text);}))
|^(PRIMITIVETYPE6{rtn.coz=6;}    (x6=FLOAT{rtn.setFLOAT($x6.text);}))
|^(PRIMITIVETYPE7{rtn.coz=7;}    (x7=DOUBLE{rtn.setDOUBLE($x7.text);}))
;

typeArguments returns[TypeArguments rtn]
@init{rtn=new TypeArguments();}
:^(TYPEARGUMENTS0{rtn.coz=0;}     (x0=typeArgument{rtn.setTypeArgument(x0);}) ( (x1=typeArgument{rtn.addTypeArgument(x1);}))*)
;

typeArgument returns[TypeArgument rtn]
@init{rtn=new TypeArgument();}
:^(TYPEARGUMENT0{rtn.coz=0;}    (x0=type{rtn.setType(x0);}))
|^(TYPEARGUMENT1{rtn.coz=1;}     ( (x1=extendsOrSuper{rtn.setExtendsOrSuper(x1);}) (x2=type{rtn.setType(x2);}) )?)
;

extendsOrSuper returns[ExtendsOrSuper rtn]
@init{rtn=new ExtendsOrSuper();}
:^(EXTENDSORSUPER0{rtn.coz=0;} 	(x0=EXTENDS{rtn.setEXTENDS($x0.text);}))
|^(EXTENDSORSUPER1{rtn.coz=1;} 	(x1=SUPER{rtn.setSUPER($x1.text);}))
;

qualifiedNameList returns[QualifiedNameList rtn]
@init{rtn=new QualifiedNameList();}
:^(QUALIFIEDNAMELIST0{rtn.coz=0;}     ( (x0=qualifiedName{rtn.addQualifiedName(x0);}))*)
;

formalParameters returns[FormalParameters rtn]
@init{rtn=new FormalParameters();}
:^(FORMALPARAMETERS0{rtn.coz=0;}    (x0=formalParameterDecls{rtn.setFormalParameterDecls(x0);})?)
;

formalParameterDecls returns[FormalParameterDecls rtn]
@init{rtn=new FormalParameterDecls();}
:^(FORMALPARAMETERDECLS0{rtn.coz=0;}    (x0=ellipsisParameterDecl{rtn.setEllipsisParameterDecl(x0);}))
|^(FORMALPARAMETERDECLS1{rtn.coz=1;}    (x1=normalParameterDecl{rtn.setNormalParameterDecl(x1);}) ( (x2=normalParameterDecl{rtn.addNormalParameterDecl(x2);}))*)
|^(FORMALPARAMETERDECLS2{rtn.coz=2;}    ((x3=normalParameterDecl{rtn.addNormalParameterDecl(x3);}) )+ (x4=ellipsisParameterDecl{rtn.setEllipsisParameterDecl(x4);}))
;

normalParameterDecl returns[NormalParameterDecl rtn]
@init{rtn=new NormalParameterDecl();}
:^(NORMALPARAMETERDECL0{rtn.coz=0;}    (x0=variableModifiers{rtn.setVariableModifiers(x0);}) (x1=type{rtn.setType(x1);}) (x2=IDENTIFIER{rtn.setIDENTIFIER($x2.text);}) (x3=BRACKETS{rtn.addBRACKETS($x3.text);})*)
;

ellipsisParameterDecl returns[EllipsisParameterDecl rtn]
@init{rtn=new EllipsisParameterDecl();}
:^(ELLIPSISPARAMETERDECL0{rtn.coz=0;}    (x0=variableModifiers{rtn.setVariableModifiers(x0);}) (x1=type{rtn.setType(x1);})   (x2=IDENTIFIER{rtn.setIDENTIFIER($x2.text);}))
;

explicitConstructorInvocation returns[ExplicitConstructorInvocation rtn]
@init{rtn=new ExplicitConstructorInvocation();}
:^(EXPLICITCONSTRUCTORINVOCATION0{rtn.coz=0;}    (x0=nonWildcardTypeArguments{rtn.setNonWildcardTypeArguments(x0);})? (x1=thisOrSuper{rtn.setThisOrSuper(x1);}) (x2=arguments{rtn.setArguments(x2);}))
|^(EXPLICITCONSTRUCTORINVOCATION1{rtn.coz=1;}    (x3=primary{rtn.setPrimary(x3);})  (x4=nonWildcardTypeArguments{rtn.setNonWildcardTypeArguments(x4);})?  (x5=arguments{rtn.setArguments(x5);}))
;

thisOrSuper returns[ThisOrSuper rtn]
@init{rtn=new ThisOrSuper();}
:^(THISORSUPER0{rtn.coz=0;} 	(x0=THIS{rtn.setTHIS($x0.text);}))
|^(THISORSUPER1{rtn.coz=1;} 	(x1=SUPER{rtn.setSUPER($x1.text);}))
;

qualifiedName returns[QualifiedName rtn]
@init{rtn=new QualifiedName();}
:^(QUALIFIEDNAME0{rtn.coz=0;}    (x0=IDENTIFIER{rtn.setIDENTIFIER($x0.text);}) ( (x1=IDENTIFIER{rtn.addIDENTIFIER($x1.text);}))*)
;

annotations returns[Annotations rtn]
@init{rtn=new Annotations();}
:^(ANNOTATIONS0{rtn.coz=0;}    (x0=annotation{rtn.addAnnotation(x0);})+)
;

annotation returns[Annotation rtn]
@init{rtn=new Annotation();}
:^(ANNOTATION0{rtn.coz=0;}     (x0=qualifiedName{rtn.setQualifiedName(x0);}) (    (x1=elementOfAnno{rtn.setElementOfAnno(x1);})?   )?)
;

elementOfAnno returns[ElementOfAnno rtn]
@init{rtn=new ElementOfAnno();}
:^(ELEMENTOFANNO0{rtn.coz=0;} 	(x0=elementValuePairs{rtn.setElementValuePairs(x0);}))
|^(ELEMENTOFANNO1{rtn.coz=1;} 	(x1=elementValue{rtn.setElementValue(x1);}))
;

elementValuePairs returns[ElementValuePairs rtn]
@init{rtn=new ElementValuePairs();}
:^(ELEMENTVALUEPAIRS0{rtn.coz=0;}    (x0=elementValuePair{rtn.setElementValuePair(x0);}) ( (x1=elementValuePair{rtn.addElementValuePair(x1);}))*)
;

elementValuePair returns[ElementValuePair rtn]
@init{rtn=new ElementValuePair();}
:^(ELEMENTVALUEPAIR0{rtn.coz=0;}    (x0=IDENTIFIER{rtn.setIDENTIFIER($x0.text);})  (x1=elementValue{rtn.setElementValue(x1);}))
;

elementValue returns[ElementValue rtn]
@init{rtn=new ElementValue();}
:^(ELEMENTVALUE0{rtn.coz=0;}    (x0=conditionalExpression{rtn.setConditionalExpression(x0);}))
|^(ELEMENTVALUE1{rtn.coz=1;}    (x1=annotation{rtn.setAnnotation(x1);}))
|^(ELEMENTVALUE2{rtn.coz=2;}    (x2=elementValueArrayInitializer{rtn.setElementValueArrayInitializer(x2);}))
;

elementValueArrayInitializer returns[ElementValueArrayInitializer rtn]
@init{rtn=new ElementValueArrayInitializer();}
:^(ELEMENTVALUEARRAYINITIALIZER0{rtn.coz=0;}    ((x0=elementValue{rtn.setElementValue(x0);})  ( (x1=elementValue{rtn.addElementValue(x1);}))*  )? (x2=COMMA{rtn.setCOMMA($x2.text);})?)
;

annotationTypeDeclaration returns[AnnotationTypeDeclaration rtn]
@init{rtn=new AnnotationTypeDeclaration();}
:^(ANNOTATIONTYPEDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);})   (x1=IDENTIFIER{rtn.setIDENTIFIER($x1.text);}) (x2=annotationTypeBody{rtn.setAnnotationTypeBody(x2);}))
;

annotationTypeBody returns[AnnotationTypeBody rtn]
@init{rtn=new AnnotationTypeBody();}
:^(ANNOTATIONTYPEBODY0{rtn.coz=0;}     (x0=annotationTypeElementDeclaration{rtn.addAnnotationTypeElementDeclaration(x0);})*)
;

annotationTypeElementDeclaration returns[AnnotationTypeElementDeclaration rtn]
@init{rtn=new AnnotationTypeElementDeclaration();}
:^(ANNOTATIONTYPEELEMENTDECLARATION0{rtn.coz=0;}    (x0=annotationMethodDeclaration{rtn.setAnnotationMethodDeclaration(x0);}))
|^(ANNOTATIONTYPEELEMENTDECLARATION1{rtn.coz=1;}    (x1=interfaceFieldDeclaration{rtn.setInterfaceFieldDeclaration(x1);}))
|^(ANNOTATIONTYPEELEMENTDECLARATION2{rtn.coz=2;}    (x2=normalClassDeclaration{rtn.setNormalClassDeclaration(x2);}))
|^(ANNOTATIONTYPEELEMENTDECLARATION3{rtn.coz=3;}    (x3=normalInterfaceDeclaration{rtn.setNormalInterfaceDeclaration(x3);}))
|^(ANNOTATIONTYPEELEMENTDECLARATION4{rtn.coz=4;}    (x4=enumDeclaration{rtn.setEnumDeclaration(x4);}))
|^(ANNOTATIONTYPEELEMENTDECLARATION5{rtn.coz=5;}    (x5=annotationTypeDeclaration{rtn.setAnnotationTypeDeclaration(x5);}))
|^(ANNOTATIONTYPEELEMENTDECLARATION6{rtn.coz=6;} )
;

annotationMethodDeclaration returns[AnnotationMethodDeclaration rtn]
@init{rtn=new AnnotationMethodDeclaration();}
:^(ANNOTATIONMETHODDECLARATION0{rtn.coz=0;}    (x0=modifiers{rtn.setModifiers(x0);}) (x1=type{rtn.setType(x1);}) (x2=IDENTIFIER{rtn.setIDENTIFIER($x2.text);})   ( (x3=elementValue{rtn.setElementValue(x3);}))?)
;

block returns[Block rtn]
@init{rtn=new Block();}
:^(BLOCK0{rtn.coz=0;}     (x0=blockStatement{rtn.addBlockStatement(x0);})*)
;

blockStatement returns[BlockStatement rtn]
@init{rtn=new BlockStatement();}
:^(BLOCKSTATEMENT0{rtn.coz=0;}    (x0=localVariableDeclarationStatement{rtn.setLocalVariableDeclarationStatement(x0);}))
|^(BLOCKSTATEMENT1{rtn.coz=1;}    (x1=classOrInterfaceDeclaration{rtn.setClassOrInterfaceDeclaration(x1);}))
|^(BLOCKSTATEMENT2{rtn.coz=2;}    (x2=statement{rtn.setStatement(x2);}))
;

localVariableDeclarationStatement returns[LocalVariableDeclarationStatement rtn]
@init{rtn=new LocalVariableDeclarationStatement();}
:^(LOCALVARIABLEDECLARATIONSTATEMENT0{rtn.coz=0;}    (x0=localVariableDeclaration{rtn.setLocalVariableDeclaration(x0);}))
;

localVariableDeclaration returns[LocalVariableDeclaration rtn]
@init{rtn=new LocalVariableDeclaration();}
:^(LOCALVARIABLEDECLARATION0{rtn.coz=0;}    (x0=variableModifiers{rtn.setVariableModifiers(x0);}) (x1=type{rtn.setType(x1);}) (x2=variableDeclarator{rtn.setVariableDeclarator(x2);}) ( (x3=variableDeclarator{rtn.addVariableDeclarator(x3);}))*)
;

statement returns[Statement rtn]
@init{rtn=new Statement();}
:^(STATEMENT0{rtn.coz=0;}    (x0=block{rtn.setBlock(x0);}))
|^(STATEMENT1{rtn.coz=1;}      (x1=expression{rtn.setExpression(x1);}) ( (x2=expression{rtn.setExpression2(x2);}))?)
|^(STATEMENT2{rtn.coz=2;}     (x3=parExpression{rtn.setParExpression(x3);}) (x4=statement{rtn.setStatement(x4);}) ( (x5=statement{rtn.setStatement2(x5);}))?)
|^(STATEMENT3{rtn.coz=3;}    (x6=forstatement{rtn.setForstatement(x6);}))
|^(STATEMENT4{rtn.coz=4;}     (x7=parExpression{rtn.setParExpression(x7);}) (x8=statement{rtn.setStatement(x8);}))
|^(STATEMENT5{rtn.coz=5;}     (x9=statement{rtn.setStatement(x9);})  (x10=parExpression{rtn.setParExpression(x10);}))
|^(STATEMENT6{rtn.coz=6;}    (x11=trystatement{rtn.setTrystatement(x11);}))
|^(STATEMENT7{rtn.coz=7;}     (x12=parExpression{rtn.setParExpression(x12);})  (x13=switchBlockStatementGroups{rtn.setSwitchBlockStatementGroups(x13);}))
|^(STATEMENT8{rtn.coz=8;}     (x14=parExpression{rtn.setParExpression(x14);}) (x15=block{rtn.setBlock(x15);}))
|^(STATEMENT9{rtn.coz=9;}     (x16=expression{rtn.setExpression(x16);})?)
|^(STATEMENT10{rtn.coz=10;}     (x17=expression{rtn.setExpression(x17);}))
|^(STATEMENT11{rtn.coz=11;}     (x18=IDENTIFIER{rtn.setIDENTIFIER($x18.text);})?)
|^(STATEMENT12{rtn.coz=12;}    (x19=IDENTIFIER{rtn.setIDENTIFIER($x19.text);})?)
|^(STATEMENT13{rtn.coz=13;}    (x20=expression{rtn.setExpression(x20);}))
|^(STATEMENT14{rtn.coz=14;}    (x21=IDENTIFIER{rtn.setIDENTIFIER($x21.text);})  (x22=statement{rtn.setStatement(x22);}))
|^(STATEMENT15{rtn.coz=15;}    (x23=SEMI{rtn.setSEMI($x23.text);}))
;

switchBlockStatementGroups returns[SwitchBlockStatementGroups rtn]
@init{rtn=new SwitchBlockStatementGroups();}
:^(SWITCHBLOCKSTATEMENTGROUPS0{rtn.coz=0;}    (x0=switchBlockStatementGroup{rtn.addSwitchBlockStatementGroup(x0);})*)
;

switchBlockStatementGroup returns[SwitchBlockStatementGroup rtn]
@init{rtn=new SwitchBlockStatementGroup();}
:^(SWITCHBLOCKSTATEMENTGROUP0{rtn.coz=0;}    (x0=switchLabel{rtn.setSwitchLabel(x0);}) (x1=blockStatement{rtn.addBlockStatement(x1);})*)
;

switchLabel returns[SwitchLabel rtn]
@init{rtn=new SwitchLabel();}
:^(SWITCHLABEL0{rtn.coz=0;}    (x0=CASE{rtn.setCASE($x0.text);}) (x1=expression{rtn.setExpression(x1);}))
|^(SWITCHLABEL1{rtn.coz=1;}    (x2=DEFAULT{rtn.setDEFAULT($x2.text);}))
;

trystatement returns[Trystatement rtn]
@init{rtn=new Trystatement();}
:^(TRYSTATEMENT0{rtn.coz=0;}     (x0=block{rtn.setBlock(x0);})   (x1=catches{rtn.setCatches(x1);})  (x2=block{rtn.setBlock2(x2);}))
|^(TRYSTATEMENT1{rtn.coz=1;}   (x3=block{rtn.setBlock(x3);})  (x4=catches{rtn.setCatches(x4);}))
|^(TRYSTATEMENT2{rtn.coz=2;}   (x5=block{rtn.setBlock(x5);})   (x6=block{rtn.setBlock2(x6);}))
;

catches returns[Catches rtn]
@init{rtn=new Catches();}
:^(CATCHES0{rtn.coz=0;}    (x0=catchClause{rtn.addCatchClause(x0);})+)
;

catchClause returns[CatchClause rtn]
@init{rtn=new CatchClause();}
:^(CATCHCLAUSE0{rtn.coz=0;}      (x0=formalParameter{rtn.setFormalParameter(x0);})  (x1=block{rtn.setBlock(x1);}))
;

formalParameter returns[FormalParameter rtn]
@init{rtn=new FormalParameter();}
:^(FORMALPARAMETER0{rtn.coz=0;}    (x0=variableModifiers{rtn.setVariableModifiers(x0);}) (x1=type{rtn.setType(x1);}) (x2=IDENTIFIER{rtn.setIDENTIFIER($x2.text);}) (x3=BRACKETS{rtn.addBRACKETS($x3.text);})*)
;

forstatement returns[Forstatement rtn]
@init{rtn=new Forstatement();}
:^(FORSTATEMENT0{rtn.coz=0;}      (x0=variableModifiers{rtn.setVariableModifiers(x0);}) (x1=type{rtn.setType(x1);}) (x2=IDENTIFIER{rtn.setIDENTIFIER($x2.text);})  (x3=expression{rtn.setExpression(x3);})  (x4=statement{rtn.setStatement(x4);}))
|^(FORSTATEMENT1{rtn.coz=1;}      (x5=forInit{rtn.setForInit(x5);})?  (x6=expression{rtn.setExpression(x6);})?  (x7=expressionList{rtn.setExpressionList(x7);})?  (x8=statement{rtn.setStatement(x8);}))
;

forInit returns[ForInit rtn]
@init{rtn=new ForInit();}
:^(FORINIT0{rtn.coz=0;}    (x0=localVariableDeclaration{rtn.setLocalVariableDeclaration(x0);}))
|^(FORINIT1{rtn.coz=1;}    (x1=expressionList{rtn.setExpressionList(x1);}))
;

parExpression returns[ParExpression rtn]
@init{rtn=new ParExpression();}
:^(PAREXPRESSION0{rtn.coz=0;}     (x0=expression{rtn.setExpression(x0);}))
;

expressionList returns[ExpressionList rtn]
@init{rtn=new ExpressionList();}
:^(EXPRESSIONLIST0{rtn.coz=0;}    (x0=expression{rtn.setExpression(x0);}) ( (x1=expression{rtn.addExpression(x1);}))*)
;

expression returns[Expression rtn]
@init{rtn=new Expression();}
:^(EXPRESSION0{rtn.coz=0;}    (x0=conditionalExpression{rtn.setConditionalExpression(x0);}) ((x1=assignmentOperator{rtn.setAssignmentOperator(x1);}) (x2=expression{rtn.setExpression(x2);}))?)
;

assignmentOperator returns[AssignmentOperator rtn]
@init{rtn=new AssignmentOperator();}
:^(ASSIGNMENTOPERATOR0{rtn.coz=0;}    (x0=EQ{rtn.setEQ($x0.text);}))
|^(ASSIGNMENTOPERATOR1{rtn.coz=1;}    (x1=PLUSEQ{rtn.setPLUSEQ($x1.text);}))
|^(ASSIGNMENTOPERATOR2{rtn.coz=2;}    (x2=SUBEQ{rtn.setSUBEQ($x2.text);}))
|^(ASSIGNMENTOPERATOR3{rtn.coz=3;}    (x3=STAREQ{rtn.setSTAREQ($x3.text);}))
|^(ASSIGNMENTOPERATOR4{rtn.coz=4;}    (x4=SLASHEQ{rtn.setSLASHEQ($x4.text);}))
|^(ASSIGNMENTOPERATOR5{rtn.coz=5;}    (x5=AMPEQ{rtn.setAMPEQ($x5.text);}))
|^(ASSIGNMENTOPERATOR6{rtn.coz=6;}    (x6=BAREQ{rtn.setBAREQ($x6.text);}))
|^(ASSIGNMENTOPERATOR7{rtn.coz=7;}    (x7=CARETEQ{rtn.setCARETEQ($x7.text);}))
|^(ASSIGNMENTOPERATOR8{rtn.coz=8;}    (x8=PERCENTEQ{rtn.setPERCENTEQ($x8.text);}))
|^(ASSIGNMENTOPERATOR9{rtn.coz=9;}    (x9=LT{rtn.setLT($x9.text);}) (x10=LT{rtn.setLT($x10.text);}) (x11=EQ{rtn.setEQ($x11.text);}))
|^(ASSIGNMENTOPERATOR10{rtn.coz=10;}    (x12=GT{rtn.setGT($x12.text);}) (x13=GT{rtn.setGT($x13.text);}) (x14=GT{rtn.setGT($x14.text);}) (x15=EQ{rtn.setEQ($x15.text);}))
|^(ASSIGNMENTOPERATOR11{rtn.coz=11;}    (x16=GT{rtn.setGT($x16.text);}) (x17=GT{rtn.setGT($x17.text);}) (x18=EQ{rtn.setEQ($x18.text);}))
;

conditionalExpression returns[ConditionalExpression rtn]
@init{rtn=new ConditionalExpression();}
:^(CONDITIONALEXPRESSION0{rtn.coz=0;}    (x0=conditionalOrExpression{rtn.setConditionalOrExpression(x0);}) ( (x1=expression{rtn.setExpression(x1);})  (x2=conditionalExpression{rtn.setConditionalExpression(x2);}))?)
;

conditionalOrExpression returns[ConditionalOrExpression rtn]
@init{rtn=new ConditionalOrExpression();}
:^(CONDITIONALOREXPRESSION0{rtn.coz=0;}    (x0=conditionalAndExpression{rtn.setConditionalAndExpression(x0);}) ( (x1=conditionalAndExpression{rtn.addConditionalAndExpression(x1);}))*)
;

conditionalAndExpression returns[ConditionalAndExpression rtn]
@init{rtn=new ConditionalAndExpression();}
:^(CONDITIONALANDEXPRESSION0{rtn.coz=0;}    (x0=inclusiveOrExpression{rtn.setInclusiveOrExpression(x0);}) ( (x1=inclusiveOrExpression{rtn.addInclusiveOrExpression(x1);}))*)
;

inclusiveOrExpression returns[InclusiveOrExpression rtn]
@init{rtn=new InclusiveOrExpression();}
:^(INCLUSIVEOREXPRESSION0{rtn.coz=0;}    (x0=exclusiveOrExpression{rtn.setExclusiveOrExpression(x0);}) ( (x1=exclusiveOrExpression{rtn.addExclusiveOrExpression(x1);}))*)
;

exclusiveOrExpression returns[ExclusiveOrExpression rtn]
@init{rtn=new ExclusiveOrExpression();}
:^(EXCLUSIVEOREXPRESSION0{rtn.coz=0;}    (x0=andExpression{rtn.setAndExpression(x0);}) ( (x1=andExpression{rtn.addAndExpression(x1);}))*)
;

andExpression returns[AndExpression rtn]
@init{rtn=new AndExpression();}
:^(ANDEXPRESSION0{rtn.coz=0;}    (x0=equalityExpression{rtn.setEqualityExpression(x0);}) ( (x1=equalityExpression{rtn.addEqualityExpression(x1);}))*)
;

equalityExpression returns[EqualityExpression rtn]
@init{rtn=new EqualityExpression();}
:^(EQUALITYEXPRESSION0{rtn.coz=0;}    (x0=instanceOfExpression{rtn.setInstanceOfExpression(x0);}) ( (x1=equalOrNotequal{rtn.addEqualOrNotequal(x1);}) (x2=instanceOfExpression{rtn.addInstanceOfExpression(x2);}))*)
;

equalOrNotequal returns[EqualOrNotequal rtn]
@init{rtn=new EqualOrNotequal();}
:^(EQUALORNOTEQUAL0{rtn.coz=0;} 	(x0=EQEQ{rtn.setEQEQ($x0.text);}))
|^(EQUALORNOTEQUAL1{rtn.coz=1;} 	(x1=BANGEQ{rtn.setBANGEQ($x1.text);}))
;

instanceOfExpression returns[InstanceOfExpression rtn]
@init{rtn=new InstanceOfExpression();}
:^(INSTANCEOFEXPRESSION0{rtn.coz=0;}    (x0=relationalExpression{rtn.setRelationalExpression(x0);}) ( (x1=type{rtn.setType(x1);}) )?)
;

relationalExpression returns[RelationalExpression rtn]
@init{rtn=new RelationalExpression();}
:^(RELATIONALEXPRESSION0{rtn.coz=0;}    (x0=shiftExpression{rtn.setShiftExpression(x0);}) ((x1=relationalOp{rtn.addRelationalOp(x1);}) (x2=shiftExpression{rtn.addShiftExpression(x2);}))*)
;

relationalOp returns[RelationalOp rtn]
@init{rtn=new RelationalOp();}
:^(RELATIONALOP0{rtn.coz=0;}    (x0=LT{rtn.setLT($x0.text);}) (x1=EQ{rtn.setEQ($x1.text);}))
|^(RELATIONALOP1{rtn.coz=1;}    (x2=GT{rtn.setGT($x2.text);}) (x3=EQ{rtn.setEQ($x3.text);}))
|^(RELATIONALOP2{rtn.coz=2;}    (x4=LT{rtn.setLT($x4.text);}))
|^(RELATIONALOP3{rtn.coz=3;}    (x5=GT{rtn.setGT($x5.text);}))
;

shiftExpression returns[ShiftExpression rtn]
@init{rtn=new ShiftExpression();}
:^(SHIFTEXPRESSION0{rtn.coz=0;}    (x0=additiveExpression{rtn.setAdditiveExpression(x0);}) ((x1=shiftOp{rtn.addShiftOp(x1);}) (x2=additiveExpression{rtn.addAdditiveExpression(x2);}))*)
;

shiftOp returns[ShiftOp rtn]
@init{rtn=new ShiftOp();}
:^(SHIFTOP0{rtn.coz=0;}     (x0=LT{rtn.setLT($x0.text);}) (x1=LT{rtn.setLT($x1.text);}))
|^(SHIFTOP1{rtn.coz=1;}     (x2=GT{rtn.setGT($x2.text);}) (x3=GT{rtn.setGT($x3.text);}))
|^(SHIFTOP2{rtn.coz=2;}     (x4=GT{rtn.setGT($x4.text);}) (x5=GT{rtn.setGT($x5.text);}) (x6=GT{rtn.setGT($x6.text);}))
;

additiveExpression returns[AdditiveExpression rtn]
@init{rtn=new AdditiveExpression();}
:^(ADDITIVEEXPRESSION0{rtn.coz=0;}    (x0=multiplicativeExpression{rtn.setMultiplicativeExpression(x0);}) ( (x1=plusOrMinus{rtn.addPlusOrMinus(x1);}) (x2=multiplicativeExpression{rtn.addMultiplicativeExpression(x2);}))*)
;

plusOrMinus returns[PlusOrMinus rtn]
@init{rtn=new PlusOrMinus();}
:^(PLUSORMINUS0{rtn.coz=0;} 	(x0=PLUS{rtn.setPLUS($x0.text);}))
|^(PLUSORMINUS1{rtn.coz=1;} 	(x1=SUB{rtn.setSUB($x1.text);}))
;

multiplicativeExpression returns[MultiplicativeExpression rtn]
@init{rtn=new MultiplicativeExpression();}
:^(MULTIPLICATIVEEXPRESSION0{rtn.coz=0;} 	(x0=unaryExpression{rtn.setUnaryExpression(x0);}) ( (x1=timesDivide{rtn.addTimesDivide(x1);}) (x2=unaryExpression{rtn.addUnaryExpression(x2);}))*)
;

timesDivide returns[TimesDivide rtn]
@init{rtn=new TimesDivide();}
:^(TIMESDIVIDE0{rtn.coz=0;} 	(x0=STAR{rtn.setSTAR($x0.text);}))
|^(TIMESDIVIDE1{rtn.coz=1;} 	(x1=SLASH{rtn.setSLASH($x1.text);}))
|^(TIMESDIVIDE2{rtn.coz=2;} 	(x2=PERCENT{rtn.setPERCENT($x2.text);}))
;

unaryExpression returns[UnaryExpression rtn]
@init{rtn=new UnaryExpression();}
:^(UNARYEXPRESSION0{rtn.coz=0;}      (x0=unaryExpression{rtn.setUnaryExpression(x0);}))
|^(UNARYEXPRESSION1{rtn.coz=1;}     (x1=unaryExpression{rtn.setUnaryExpression(x1);}))
|^(UNARYEXPRESSION2{rtn.coz=2;}     (x2=unaryExpression{rtn.setUnaryExpression(x2);}))
|^(UNARYEXPRESSION3{rtn.coz=3;}     (x3=unaryExpression{rtn.setUnaryExpression(x3);}))
|^(UNARYEXPRESSION4{rtn.coz=4;}    (x4=unaryExpressionNotPlusMinus{rtn.setUnaryExpressionNotPlusMinus(x4);}))
;

unaryExpressionNotPlusMinus returns[UnaryExpressionNotPlusMinus rtn]
@init{rtn=new UnaryExpressionNotPlusMinus();}
:^(UNARYEXPRESSIONNOTPLUSMINUS0{rtn.coz=0;}     (x0=unaryExpression{rtn.setUnaryExpression(x0);}))
|^(UNARYEXPRESSIONNOTPLUSMINUS1{rtn.coz=1;}     (x1=unaryExpression{rtn.setUnaryExpression(x1);}))
|^(UNARYEXPRESSIONNOTPLUSMINUS2{rtn.coz=2;}    (x2=castExpression{rtn.setCastExpression(x2);}))
|^(UNARYEXPRESSIONNOTPLUSMINUS3{rtn.coz=3;}    (x3=primary{rtn.setPrimary(x3);}) (x4=selector{rtn.addSelector(x4);})* (x5=doublePlusMinus{rtn.setDoublePlusMinus(x5);})?)
;

doublePlusMinus returns[DoublePlusMinus rtn]
@init{rtn=new DoublePlusMinus();}
:^(DOUBLEPLUSMINUS0{rtn.coz=0;} 	(x0=PLUSPLUS{rtn.setPLUSPLUS($x0.text);}))
|^(DOUBLEPLUSMINUS1{rtn.coz=1;} 	(x1=SUBSUB{rtn.setSUBSUB($x1.text);}))
;

castExpression returns[CastExpression rtn]
@init{rtn=new CastExpression();}
:^(CASTEXPRESSION0{rtn.coz=0;}     (x0=primitiveType{rtn.setPrimitiveType(x0);})  (x1=unaryExpression{rtn.setUnaryExpression(x1);}))
|^(CASTEXPRESSION1{rtn.coz=1;}     (x2=type{rtn.setType(x2);})  (x3=unaryExpressionNotPlusMinus{rtn.setUnaryExpressionNotPlusMinus(x3);}))
;

primary returns[Primary rtn]
@init{rtn=new Primary();}
:^(PRIMARY0{rtn.coz=0;}    (x0=parExpression{rtn.setParExpression(x0);}))
|^(PRIMARY1{rtn.coz=1;}     ( (x1=IDENTIFIER{rtn.addIDENTIFIER($x1.text);}))* (x2=identifierSuffix{rtn.setIdentifierSuffix(x2);})?)
|^(PRIMARY2{rtn.coz=2;}    (x3=IDENTIFIER{rtn.setIDENTIFIER($x3.text);}) ( (x4=IDENTIFIER{rtn.addIDENTIFIER($x4.text);}))* (x5=identifierSuffix{rtn.setIdentifierSuffix(x5);})?)
|^(PRIMARY3{rtn.coz=3;}     (x6=superSuffix{rtn.setSuperSuffix(x6);}))
|^(PRIMARY4{rtn.coz=4;}    (x7=literal{rtn.setLiteral(x7);}))
|^(PRIMARY5{rtn.coz=5;}    (x8=creator{rtn.setCreator(x8);}))
|^(PRIMARY6{rtn.coz=6;}    (x9=primitiveType{rtn.setPrimitiveType(x9);}) ((x10=BRACKETS{rtn.addBRACKETS($x10.text);}))*)
|^(PRIMARY7{rtn.coz=7;} )
;

superSuffix returns[SuperSuffix rtn]
@init{rtn=new SuperSuffix();}
:^(SUPERSUFFIX0{rtn.coz=0;}    (x0=arguments{rtn.setArguments(x0);}))
|^(SUPERSUFFIX1{rtn.coz=1;}     (x1=typeArguments{rtn.setTypeArguments(x1);})? (x2=IDENTIFIER{rtn.setIDENTIFIER($x2.text);}) (x3=arguments{rtn.setArguments(x3);})?)
;

identifierSuffix returns[IdentifierSuffix rtn]
@init{rtn=new IdentifierSuffix();}
:^(IDENTIFIERSUFFIX0{rtn.coz=0;}    (x0=BRACKETS{rtn.addBRACKETS($x0.text);})+)
|^(IDENTIFIERSUFFIX1{rtn.coz=1;}    ( (x1=expression{rtn.addExpression(x1);})  )+)
|^(IDENTIFIERSUFFIX2{rtn.coz=2;}    (x2=arguments{rtn.setArguments(x2);}))
|^(IDENTIFIERSUFFIX3{rtn.coz=3;} )
|^(IDENTIFIERSUFFIX4{rtn.coz=4;}     (x3=nonWildcardTypeArguments{rtn.setNonWildcardTypeArguments(x3);}) (x4=IDENTIFIER{rtn.setIDENTIFIER($x4.text);}) (x5=arguments{rtn.setArguments(x5);}))
|^(IDENTIFIERSUFFIX5{rtn.coz=5;} )
|^(IDENTIFIERSUFFIX6{rtn.coz=6;}      (x6=arguments{rtn.setArguments(x6);}))
|^(IDENTIFIERSUFFIX7{rtn.coz=7;}    (x7=innerCreator{rtn.setInnerCreator(x7);}))
;

selector returns[Selector rtn]
@init{rtn=new Selector();}
:^(SELECTOR0{rtn.coz=0;}     (x0=IDENTIFIER{rtn.setIDENTIFIER($x0.text);}) (x1=arguments{rtn.setArguments(x1);})?)
|^(SELECTOR1{rtn.coz=1;} )
|^(SELECTOR2{rtn.coz=2;}      (x2=superSuffix{rtn.setSuperSuffix(x2);}))
|^(SELECTOR3{rtn.coz=3;}    (x3=innerCreator{rtn.setInnerCreator(x3);}))
|^(SELECTOR4{rtn.coz=4;}     (x4=expression{rtn.setExpression(x4);}))
;

creator returns[Creator rtn]
@init{rtn=new Creator();}
:^(CREATOR0{rtn.coz=0;}     (x0=nonWildcardTypeArguments{rtn.setNonWildcardTypeArguments(x0);}) (x1=classOrInterfaceType{rtn.setClassOrInterfaceType(x1);}) (x2=classCreatorRest{rtn.setClassCreatorRest(x2);}))
|^(CREATOR1{rtn.coz=1;}     (x3=classOrInterfaceType{rtn.setClassOrInterfaceType(x3);}) (x4=classCreatorRest{rtn.setClassCreatorRest(x4);}))
|^(CREATOR2{rtn.coz=2;}    (x5=arrayCreator{rtn.setArrayCreator(x5);}))
;

arrayCreator returns[ArrayCreator rtn]
@init{rtn=new ArrayCreator();}
:^(ARRAYCREATOR0{rtn.coz=0;}     (x0=createdName{rtn.setCreatedName(x0);}) (x1=BRACKETS{rtn.addBRACKETS($x1.text);})+ (x2=arrayInitializer{rtn.setArrayInitializer(x2);}))
|^(ARRAYCREATOR1{rtn.coz=1;}     (x3=createdName{rtn.setCreatedName(x3);})  (x4=expression{rtn.setExpression(x4);})  (    (x5=expression{rtn.addExpression(x5);}) )* (x6=BRACKETS{rtn.addBRACKETS($x6.text);})*)
;

variableInitializer returns[VariableInitializer rtn]
@init{rtn=new VariableInitializer();}
:^(VARIABLEINITIALIZER0{rtn.coz=0;}    (x0=arrayInitializer{rtn.setArrayInitializer(x0);}))
|^(VARIABLEINITIALIZER1{rtn.coz=1;}    (x1=expression{rtn.setExpression(x1);}))
;

arrayInitializer returns[ArrayInitializer rtn]
@init{rtn=new ArrayInitializer();}
:^(ARRAYINITIALIZER0{rtn.coz=0;}     ((x0=variableInitializer{rtn.setVariableInitializer(x0);}) ( (x1=variableInitializer{rtn.addVariableInitializer(x1);}) )* )? ((x2=COMMA{rtn.setCOMMA($x2.text);}))?)
;

createdName returns[CreatedName rtn]
@init{rtn=new CreatedName();}
:^(CREATEDNAME0{rtn.coz=0;}    (x0=classOrInterfaceType{rtn.setClassOrInterfaceType(x0);}))
|^(CREATEDNAME1{rtn.coz=1;}    (x1=primitiveType{rtn.setPrimitiveType(x1);}))
;

innerCreator returns[InnerCreator rtn]
@init{rtn=new InnerCreator();}
:^(INNERCREATOR0{rtn.coz=0;}      (x0=nonWildcardTypeArguments{rtn.setNonWildcardTypeArguments(x0);})? (x1=IDENTIFIER{rtn.setIDENTIFIER($x1.text);}) (x2=typeArguments{rtn.setTypeArguments(x2);})?  (x3=classCreatorRest{rtn.setClassCreatorRest(x3);}))
;

classCreatorRest returns[ClassCreatorRest rtn]
@init{rtn=new ClassCreatorRest();}
:^(CLASSCREATORREST0{rtn.coz=0;}    (x0=arguments{rtn.setArguments(x0);}) (x1=classBody{rtn.setClassBody(x1);})?)
;

nonWildcardTypeArguments returns[NonWildcardTypeArguments rtn]
@init{rtn=new NonWildcardTypeArguments();}
:^(NONWILDCARDTYPEARGUMENTS0{rtn.coz=0;}     (x0=typeList{rtn.setTypeList(x0);}))
;

arguments returns[Arguments rtn]
@init{rtn=new Arguments();}
:^(ARGUMENTS0{rtn.coz=0;}     (x0=expressionList{rtn.setExpressionList(x0);})?)
;

literal returns[Literal rtn]
@init{rtn=new Literal();}
:^(LITERAL0{rtn.coz=0;}    (x0=INTLITERAL{rtn.setINTLITERAL($x0.text);}))
|^(LITERAL1{rtn.coz=1;}    (x1=LONGLITERAL{rtn.setLONGLITERAL($x1.text);}))
|^(LITERAL2{rtn.coz=2;}    (x2=FLOATLITERAL{rtn.setFLOATLITERAL($x2.text);}))
|^(LITERAL3{rtn.coz=3;}    (x3=DOUBLELITERAL{rtn.setDOUBLELITERAL($x3.text);}))
|^(LITERAL4{rtn.coz=4;}    (x4=CHARLITERAL{rtn.setCHARLITERAL($x4.text);}))
|^(LITERAL5{rtn.coz=5;}    (x5=STRINGLITERAL{rtn.setSTRINGLITERAL($x5.text);}))
|^(LITERAL6{rtn.coz=6;}    (x6=TRUE{rtn.setTRUE($x6.text);}))
|^(LITERAL7{rtn.coz=7;}    (x7=FALSE{rtn.setFALSE($x7.text);}))
|^(LITERAL8{rtn.coz=8;}    (x8=NULL{rtn.setNULL($x8.text);}))
;



//rules end
