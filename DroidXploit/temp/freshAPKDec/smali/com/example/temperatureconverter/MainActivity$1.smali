.class Lcom/example/temperatureconverter/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/temperatureconverter/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/temperatureconverter/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/temperatureconverter/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    const v4, 0x43889333

    const/high16 v3, 0x4200

    const v2, 0x3fe66666

    .line 44
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, v1, Lcom/example/temperatureconverter/MainActivity;->txtKel:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/example/temperatureconverter/MainActivity;->kel:Ljava/lang/String;

    .line 45
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, v1, Lcom/example/temperatureconverter/MainActivity;->txtFaren:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/example/temperatureconverter/MainActivity;->far:Ljava/lang/String;

    .line 46
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, v1, Lcom/example/temperatureconverter/MainActivity;->txtCel:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/example/temperatureconverter/MainActivity;->cel:Ljava/lang/String;

    .line 63
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->far:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 64
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, v1, Lcom/example/temperatureconverter/MainActivity;->far:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->f:F

    .line 66
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v1, v1, Lcom/example/temperatureconverter/MainActivity;->f:F

    sub-float/2addr v1, v3

    div-float/2addr v1, v2

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->c:F

    .line 67
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v1, v1, Lcom/example/temperatureconverter/MainActivity;->c:F

    add-float/2addr v1, v4

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->k:F

    .line 69
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtCel:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v2, v2, Lcom/example/temperatureconverter/MainActivity;->c:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtKel:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v2, v2, Lcom/example/temperatureconverter/MainActivity;->k:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 73
    :cond_1
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->cel:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 74
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, v1, Lcom/example/temperatureconverter/MainActivity;->cel:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->c:F

    .line 76
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v1, v1, Lcom/example/temperatureconverter/MainActivity;->c:F

    mul-float/2addr v1, v2

    add-float/2addr v1, v3

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->f:F

    .line 77
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v1, v1, Lcom/example/temperatureconverter/MainActivity;->c:F

    add-float/2addr v1, v4

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->k:F

    .line 79
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtFaren:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v2, v2, Lcom/example/temperatureconverter/MainActivity;->f:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 80
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtKel:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v2, v2, Lcom/example/temperatureconverter/MainActivity;->k:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 82
    :cond_2
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->kel:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, v1, Lcom/example/temperatureconverter/MainActivity;->kel:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->k:F

    .line 85
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v1, v1, Lcom/example/temperatureconverter/MainActivity;->k:F

    sub-float/2addr v1, v4

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->c:F

    .line 86
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v1, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v1, v1, Lcom/example/temperatureconverter/MainActivity;->c:F

    mul-float/2addr v1, v2

    add-float/2addr v1, v3

    iput v1, v0, Lcom/example/temperatureconverter/MainActivity;->f:F

    .line 88
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtFaren:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v2, v2, Lcom/example/temperatureconverter/MainActivity;->f:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 89
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtCel:Landroid/widget/EditText;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/example/temperatureconverter/MainActivity$1;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget v2, v2, Lcom/example/temperatureconverter/MainActivity;->c:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method
