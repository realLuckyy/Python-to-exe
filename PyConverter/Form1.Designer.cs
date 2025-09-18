namespace PyConverter
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;
        
        private System.Windows.Forms.Panel panelHeader;
        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Panel panelMain;
        private System.Windows.Forms.GroupBox groupBoxInput;
        private System.Windows.Forms.Label lblPythonFile;
        private System.Windows.Forms.TextBox txtPythonFile;
        private System.Windows.Forms.Button btnBrowsePython;
        private System.Windows.Forms.Label lblOutputDir;
        private System.Windows.Forms.TextBox txtOutputDir;
        private System.Windows.Forms.Button btnBrowseOutput;
        private System.Windows.Forms.GroupBox groupBoxOptions;
        private System.Windows.Forms.CheckBox chkOneFile;
        private System.Windows.Forms.CheckBox chkConsole;
        private System.Windows.Forms.CheckBox chkDebug;
        private System.Windows.Forms.Label lblIcon;
        private System.Windows.Forms.TextBox txtIconPath;
        private System.Windows.Forms.Button btnBrowseIcon;
        private System.Windows.Forms.GroupBox groupBoxOutput;
        private System.Windows.Forms.TextBox txtOutput;
        private System.Windows.Forms.Panel panelButtons;
        private System.Windows.Forms.Button btnConvert;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.ProgressBar progressBar;
        private System.Windows.Forms.Label lblStatus;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            panelHeader = new Panel();
            pictureBox1 = new PictureBox();
            lblTitle = new Label();
            panelMain = new Panel();
            groupBoxOutput = new GroupBox();
            txtOutput = new TextBox();
            groupBoxOptions = new GroupBox();
            btnBrowseIcon = new Button();
            txtIconPath = new TextBox();
            lblIcon = new Label();
            chkDebug = new CheckBox();
            chkConsole = new CheckBox();
            chkOneFile = new CheckBox();
            groupBoxInput = new GroupBox();
            btnBrowseOutput = new Button();
            txtOutputDir = new TextBox();
            lblOutputDir = new Label();
            btnBrowsePython = new Button();
            txtPythonFile = new TextBox();
            lblPythonFile = new Label();
            panelButtons = new Panel();
            label1 = new Label();
            lblStatus = new Label();
            progressBar = new ProgressBar();
            btnClear = new Button();
            btnConvert = new Button();
            panelHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).BeginInit();
            panelMain.SuspendLayout();
            groupBoxOutput.SuspendLayout();
            groupBoxOptions.SuspendLayout();
            groupBoxInput.SuspendLayout();
            panelButtons.SuspendLayout();
            SuspendLayout();
            // 
            // panelHeader
            // 
            panelHeader.BackColor = Color.FromArgb(41, 53, 65);
            panelHeader.Controls.Add(pictureBox1);
            panelHeader.Controls.Add(lblTitle);
            panelHeader.Dock = DockStyle.Top;
            panelHeader.Location = new Point(0, 0);
            panelHeader.Name = "panelHeader";
            panelHeader.Size = new Size(900, 70);
            panelHeader.TabIndex = 0;
            // 
            // pictureBox1
            // 
            pictureBox1.Image = Properties.Resources.demonlogo;
            pictureBox1.Location = new Point(20, 15);
            pictureBox1.Name = "pictureBox1";
            pictureBox1.Size = new Size(40, 40);
            pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            pictureBox1.TabIndex = 1;
            pictureBox1.TabStop = false;
            // 
            // lblTitle
            // 
            lblTitle.AutoSize = true;
            lblTitle.Font = new Font("Segoe UI", 18F, FontStyle.Bold);
            lblTitle.ForeColor = Color.White;
            lblTitle.Location = new Point(70, 20);
            lblTitle.Name = "lblTitle";
            lblTitle.Size = new Size(296, 32);
            lblTitle.TabIndex = 0;
            lblTitle.Text = "Python to EXE Converter";
            // 
            // panelMain
            // 
            panelMain.BackColor = Color.FromArgb(240, 244, 247);
            panelMain.Controls.Add(groupBoxOutput);
            panelMain.Controls.Add(groupBoxOptions);
            panelMain.Controls.Add(groupBoxInput);
            panelMain.Dock = DockStyle.Fill;
            panelMain.Location = new Point(0, 70);
            panelMain.Name = "panelMain";
            panelMain.Padding = new Padding(20);
            panelMain.Size = new Size(900, 470);
            panelMain.TabIndex = 1;
            // 
            // groupBoxOutput
            // 
            groupBoxOutput.Anchor = AnchorStyles.Top | AnchorStyles.Bottom | AnchorStyles.Left | AnchorStyles.Right;
            groupBoxOutput.Controls.Add(txtOutput);
            groupBoxOutput.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            groupBoxOutput.ForeColor = Color.FromArgb(41, 53, 65);
            groupBoxOutput.Location = new Point(20, 280);
            groupBoxOutput.Name = "groupBoxOutput";
            groupBoxOutput.Size = new Size(860, 170);
            groupBoxOutput.TabIndex = 2;
            groupBoxOutput.TabStop = false;
            groupBoxOutput.Text = "Output Log";
            // 
            // txtOutput
            // 
            txtOutput.BackColor = Color.FromArgb(44, 62, 80);
            txtOutput.Dock = DockStyle.Fill;
            txtOutput.Font = new Font("Consolas", 9F);
            txtOutput.ForeColor = Color.LightGreen;
            txtOutput.Location = new Point(3, 21);
            txtOutput.Multiline = true;
            txtOutput.Name = "txtOutput";
            txtOutput.ReadOnly = true;
            txtOutput.ScrollBars = ScrollBars.Both;
            txtOutput.Size = new Size(854, 146);
            txtOutput.TabIndex = 0;
            txtOutput.TextChanged += txtOutput_TextChanged;
            // 
            // groupBoxOptions
            // 
            groupBoxOptions.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            groupBoxOptions.Controls.Add(btnBrowseIcon);
            groupBoxOptions.Controls.Add(txtIconPath);
            groupBoxOptions.Controls.Add(lblIcon);
            groupBoxOptions.Controls.Add(chkDebug);
            groupBoxOptions.Controls.Add(chkConsole);
            groupBoxOptions.Controls.Add(chkOneFile);
            groupBoxOptions.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            groupBoxOptions.ForeColor = Color.FromArgb(41, 53, 65);
            groupBoxOptions.Location = new Point(20, 150);
            groupBoxOptions.Name = "groupBoxOptions";
            groupBoxOptions.Size = new Size(860, 120);
            groupBoxOptions.TabIndex = 1;
            groupBoxOptions.TabStop = false;
            groupBoxOptions.Text = "Conversion Options";
            // 
            // btnBrowseIcon
            // 
            btnBrowseIcon.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btnBrowseIcon.BackColor = Color.FromArgb(52, 152, 219);
            btnBrowseIcon.FlatStyle = FlatStyle.Flat;
            btnBrowseIcon.ForeColor = Color.White;
            btnBrowseIcon.Location = new Point(800, 83);
            btnBrowseIcon.Name = "btnBrowseIcon";
            btnBrowseIcon.Size = new Size(50, 25);
            btnBrowseIcon.TabIndex = 5;
            btnBrowseIcon.Text = "...";
            btnBrowseIcon.UseVisualStyleBackColor = false;
            btnBrowseIcon.Click += btnBrowseIcon_Click;
            // 
            // txtIconPath
            // 
            txtIconPath.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            txtIconPath.Font = new Font("Segoe UI", 9F);
            txtIconPath.Location = new Point(110, 83);
            txtIconPath.Name = "txtIconPath";
            txtIconPath.Size = new Size(680, 23);
            txtIconPath.TabIndex = 4;
            // 
            // lblIcon
            // 
            lblIcon.AutoSize = true;
            lblIcon.Font = new Font("Segoe UI", 9F);
            lblIcon.Location = new Point(20, 86);
            lblIcon.Name = "lblIcon";
            lblIcon.Size = new Size(84, 15);
            lblIcon.TabIndex = 3;
            lblIcon.Text = "Icon File (.ico):";
            // 
            // chkDebug
            // 
            chkDebug.AutoSize = true;
            chkDebug.Font = new Font("Segoe UI", 9F);
            chkDebug.Location = new Point(300, 50);
            chkDebug.Name = "chkDebug";
            chkDebug.Size = new Size(95, 19);
            chkDebug.TabIndex = 2;
            chkDebug.Text = "Debug Mode";
            chkDebug.UseVisualStyleBackColor = true;
            // 
            // chkConsole
            // 
            chkConsole.AutoSize = true;
            chkConsole.Checked = true;
            chkConsole.CheckState = CheckState.Checked;
            chkConsole.Font = new Font("Segoe UI", 9F);
            chkConsole.Location = new Point(160, 50);
            chkConsole.Name = "chkConsole";
            chkConsole.Size = new Size(97, 19);
            chkConsole.TabIndex = 1;
            chkConsole.Text = "Hide Console";
            chkConsole.UseVisualStyleBackColor = true;
            // 
            // chkOneFile
            // 
            chkOneFile.AutoSize = true;
            chkOneFile.Checked = true;
            chkOneFile.CheckState = CheckState.Checked;
            chkOneFile.Font = new Font("Segoe UI", 9F);
            chkOneFile.Location = new Point(20, 50);
            chkOneFile.Name = "chkOneFile";
            chkOneFile.Size = new Size(120, 19);
            chkOneFile.TabIndex = 0;
            chkOneFile.Text = "Single File Output";
            chkOneFile.UseVisualStyleBackColor = true;
            // 
            // groupBoxInput
            // 
            groupBoxInput.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            groupBoxInput.Controls.Add(btnBrowseOutput);
            groupBoxInput.Controls.Add(txtOutputDir);
            groupBoxInput.Controls.Add(lblOutputDir);
            groupBoxInput.Controls.Add(btnBrowsePython);
            groupBoxInput.Controls.Add(txtPythonFile);
            groupBoxInput.Controls.Add(lblPythonFile);
            groupBoxInput.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            groupBoxInput.ForeColor = Color.FromArgb(41, 53, 65);
            groupBoxInput.Location = new Point(20, 20);
            groupBoxInput.Name = "groupBoxInput";
            groupBoxInput.Size = new Size(860, 120);
            groupBoxInput.TabIndex = 0;
            groupBoxInput.TabStop = false;
            groupBoxInput.Text = "Input Files";
            // 
            // btnBrowseOutput
            // 
            btnBrowseOutput.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btnBrowseOutput.BackColor = Color.FromArgb(52, 152, 219);
            btnBrowseOutput.FlatStyle = FlatStyle.Flat;
            btnBrowseOutput.ForeColor = Color.White;
            btnBrowseOutput.Location = new Point(800, 75);
            btnBrowseOutput.Name = "btnBrowseOutput";
            btnBrowseOutput.Size = new Size(50, 25);
            btnBrowseOutput.TabIndex = 5;
            btnBrowseOutput.Text = "...";
            btnBrowseOutput.UseVisualStyleBackColor = false;
            btnBrowseOutput.Click += btnBrowseOutput_Click;
            // 
            // txtOutputDir
            // 
            txtOutputDir.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            txtOutputDir.Font = new Font("Segoe UI", 9F);
            txtOutputDir.Location = new Point(130, 75);
            txtOutputDir.Name = "txtOutputDir";
            txtOutputDir.Size = new Size(660, 23);
            txtOutputDir.TabIndex = 4;
            // 
            // lblOutputDir
            // 
            lblOutputDir.AutoSize = true;
            lblOutputDir.Font = new Font("Segoe UI", 9F);
            lblOutputDir.Location = new Point(20, 78);
            lblOutputDir.Name = "lblOutputDir";
            lblOutputDir.Size = new Size(99, 15);
            lblOutputDir.TabIndex = 3;
            lblOutputDir.Text = "Output Directory:";
            // 
            // btnBrowsePython
            // 
            btnBrowsePython.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btnBrowsePython.BackColor = Color.FromArgb(52, 152, 219);
            btnBrowsePython.FlatStyle = FlatStyle.Flat;
            btnBrowsePython.ForeColor = Color.White;
            btnBrowsePython.Location = new Point(800, 35);
            btnBrowsePython.Name = "btnBrowsePython";
            btnBrowsePython.Size = new Size(50, 25);
            btnBrowsePython.TabIndex = 2;
            btnBrowsePython.Text = "...";
            btnBrowsePython.UseVisualStyleBackColor = false;
            btnBrowsePython.Click += btnBrowsePython_Click;
            // 
            // txtPythonFile
            // 
            txtPythonFile.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            txtPythonFile.Font = new Font("Segoe UI", 9F);
            txtPythonFile.Location = new Point(130, 35);
            txtPythonFile.Name = "txtPythonFile";
            txtPythonFile.Size = new Size(660, 23);
            txtPythonFile.TabIndex = 1;
            // 
            // lblPythonFile
            // 
            lblPythonFile.AutoSize = true;
            lblPythonFile.Font = new Font("Segoe UI", 9F);
            lblPythonFile.Location = new Point(20, 38);
            lblPythonFile.Name = "lblPythonFile";
            lblPythonFile.Size = new Size(96, 15);
            lblPythonFile.TabIndex = 0;
            lblPythonFile.Text = "Python File (.py):";
            // 
            // panelButtons
            // 
            panelButtons.BackColor = Color.FromArgb(236, 240, 241);
            panelButtons.Controls.Add(label1);
            panelButtons.Controls.Add(lblStatus);
            panelButtons.Controls.Add(progressBar);
            panelButtons.Controls.Add(btnClear);
            panelButtons.Controls.Add(btnConvert);
            panelButtons.Dock = DockStyle.Bottom;
            panelButtons.Location = new Point(0, 540);
            panelButtons.Name = "panelButtons";
            panelButtons.Size = new Size(900, 80);
            panelButtons.TabIndex = 2;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 9F);
            label1.Location = new Point(3, 63);
            label1.Name = "label1";
            label1.Size = new Size(243, 15);
            label1.TabIndex = 6;
            label1.Text = "Created By Luckyy - click here to support me";
            label1.Click += label1_Click;
            // 
            // lblStatus
            // 
            lblStatus.AutoSize = true;
            lblStatus.Font = new Font("Segoe UI", 9F);
            lblStatus.ForeColor = Color.FromArgb(41, 53, 65);
            lblStatus.Location = new Point(20, 15);
            lblStatus.Name = "lblStatus";
            lblStatus.Size = new Size(39, 15);
            lblStatus.TabIndex = 3;
            lblStatus.Text = "Ready";
            // 
            // progressBar
            // 
            progressBar.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            progressBar.Location = new Point(20, 35);
            progressBar.Name = "progressBar";
            progressBar.Size = new Size(650, 25);
            progressBar.TabIndex = 2;
            // 
            // btnClear
            // 
            btnClear.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btnClear.BackColor = Color.FromArgb(231, 76, 60);
            btnClear.FlatStyle = FlatStyle.Flat;
            btnClear.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            btnClear.ForeColor = Color.White;
            btnClear.Location = new Point(690, 35);
            btnClear.Name = "btnClear";
            btnClear.Size = new Size(90, 35);
            btnClear.TabIndex = 1;
            btnClear.Text = "Clear";
            btnClear.UseVisualStyleBackColor = false;
            btnClear.Click += btnClear_Click;
            // 
            // btnConvert
            // 
            btnConvert.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btnConvert.BackColor = Color.FromArgb(39, 174, 96);
            btnConvert.FlatStyle = FlatStyle.Flat;
            btnConvert.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            btnConvert.ForeColor = Color.White;
            btnConvert.Location = new Point(790, 35);
            btnConvert.Name = "btnConvert";
            btnConvert.Size = new Size(90, 35);
            btnConvert.TabIndex = 0;
            btnConvert.Text = "Convert";
            btnConvert.UseVisualStyleBackColor = false;
            btnConvert.Click += btnConvert_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(900, 620);
            Controls.Add(panelMain);
            Controls.Add(panelButtons);
            Controls.Add(panelHeader);
            Font = new Font("Segoe UI", 9F);
            Icon = (Icon)resources.GetObject("$this.Icon");
            MinimumSize = new Size(900, 600);
            Name = "Form1";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Python to EXE Converter";
            panelHeader.ResumeLayout(false);
            panelHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)pictureBox1).EndInit();
            panelMain.ResumeLayout(false);
            groupBoxOutput.ResumeLayout(false);
            groupBoxOutput.PerformLayout();
            groupBoxOptions.ResumeLayout(false);
            groupBoxOptions.PerformLayout();
            groupBoxInput.ResumeLayout(false);
            groupBoxInput.PerformLayout();
            panelButtons.ResumeLayout(false);
            panelButtons.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private Label label1;
    }
}
