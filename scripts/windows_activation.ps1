$versionChoice = Read-Host "ASH - Enter the Windows version (caps sensitive) (Home, Home N, Home Single Language, Home Country Specific, Professional, Professional N, Education, Education N, Enterprise, Enterprise N)"

switch ($versionChoice) {
    "Home" {
        $activationKey = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
    }
    "Home N" {
        $activationKey = "3KHY7-WNT83-DGQKR-F7HPR-844BM"
    }
    "Home Single Language" {
        $activationKey = "7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
    }
    "Home Country Specific" {
        $activationKey = "PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
    }
    "Professional" {
        $activationKey = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
    }
    "Professional N" {
        $activationKey = "MH37W-N47XK-V7XM9-C7227-GCQG9"
    }
    "Education" {
        $activationKey = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
    }
    "Education N" {
        $activationKey = "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
    }
    "Enterprise" {
        $activationKey = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
    }
    "Enterprise N" {
        $activationKey = "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
    }
    default {
        Write-Host "ASH - Invalid choice. Please enter a valid Windows version." -ForegroundColor Red
        Exit
    }
}

slmgr /ipk $activationKey
slmgr /skms kms9.msguides.com
slmgr /ato
slmgr /xpr
