export interface AnomalieElement {
    id: number;
    nomOperateur: string;
    prenomOperateur: string;
    nomUA: string;
    flux: string;
    activite: string;
    typeAnomalie:string;
    anomalieStatut:string;
    dateAnomalie: Date;
    nbrPoints: number;
    isEdit:boolean;
  }