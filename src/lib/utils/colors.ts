  export enum AccentColor{ 
      YELLOW =  '#f6c177', 
      BEIGE = '#ebbcba', 
      BLUE = '#9ccfd8', 
      PURPLE = '#c4a7e7'
  } 
	export function getAccentColor(avoid: AccentColor | undefined = undefined): AccentColor {
		const accents  = Object.values(AccentColor);

		let rIndex = Math.floor(Math.random() * 6);
    
    do  {
      rIndex = Math.floor(Math.random() * 6);
    } while(avoid && accents[rIndex] === avoid)

		return accents[rIndex];
	}
