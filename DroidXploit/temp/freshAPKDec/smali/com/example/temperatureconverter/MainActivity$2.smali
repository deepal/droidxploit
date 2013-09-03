.class Lcom/example/temperatureconverter/MainActivity$2;
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
    iput-object p1, p0, Lcom/example/temperatureconverter/MainActivity$2;->this$0:Lcom/example/temperatureconverter/MainActivity;

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 107
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$2;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtCel:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 108
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$2;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtKel:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 109
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity$2;->this$0:Lcom/example/temperatureconverter/MainActivity;

    iget-object v0, v0, Lcom/example/temperatureconverter/MainActivity;->txtFaren:Landroid/widget/EditText;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 111
    return-void
.end method
