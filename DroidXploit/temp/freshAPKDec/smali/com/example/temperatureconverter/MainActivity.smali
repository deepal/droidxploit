.class public Lcom/example/temperatureconverter/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field backMusic:Landroid/media/MediaPlayer;

.field btnClear:Landroid/widget/Button;

.field btnGo:Landroid/widget/Button;

.field c:F

.field cel:Ljava/lang/String;

.field f:F

.field far:Ljava/lang/String;

.field k:F

.field kel:Ljava/lang/String;

.field txtCel:Landroid/widget/EditText;

.field txtFaren:Landroid/widget/EditText;

.field txtKel:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const/high16 v0, 0x7f03

    invoke-virtual {p0, v0}, Lcom/example/temperatureconverter/MainActivity;->setContentView(I)V

    .line 28
    const/high16 v0, 0x7f04

    invoke-static {p0, v0}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    iput-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->backMusic:Landroid/media/MediaPlayer;

    .line 29
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->backMusic:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 30
    const v0, 0x7f090008

    invoke-virtual {p0, v0}, Lcom/example/temperatureconverter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->btnGo:Landroid/widget/Button;

    .line 31
    const v0, 0x7f090007

    invoke-virtual {p0, v0}, Lcom/example/temperatureconverter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->btnClear:Landroid/widget/Button;

    .line 32
    const v0, 0x7f090006

    invoke-virtual {p0, v0}, Lcom/example/temperatureconverter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->txtKel:Landroid/widget/EditText;

    .line 33
    const v0, 0x7f090002

    invoke-virtual {p0, v0}, Lcom/example/temperatureconverter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->txtFaren:Landroid/widget/EditText;

    .line 34
    const v0, 0x7f090003

    invoke-virtual {p0, v0}, Lcom/example/temperatureconverter/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->txtCel:Landroid/widget/EditText;

    .line 37
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->btnGo:Landroid/widget/Button;

    new-instance v1, Lcom/example/temperatureconverter/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/example/temperatureconverter/MainActivity$1;-><init>(Lcom/example/temperatureconverter/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->btnClear:Landroid/widget/Button;

    new-instance v1, Lcom/example/temperatureconverter/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/example/temperatureconverter/MainActivity$2;-><init>(Lcom/example/temperatureconverter/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .parameter "menu"

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/example/temperatureconverter/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f08

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 142
    const/4 v0, 0x1

    return v0
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 123
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 124
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->backMusic:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 125
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 132
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 133
    iget-object v0, p0, Lcom/example/temperatureconverter/MainActivity;->backMusic:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 134
    return-void
.end method
