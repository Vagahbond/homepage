import { type BasePayload, getPayload } from 'payload';
import payloadConfig  from "backend/src/payload.config.ts"

class PayloadHandle {
  #payloadInstance: BasePayload | undefined;

  async #init() {
    getPayload({ config: payloadConfig }).then((p => {
      this.#payloadInstance = p 
      console.log("Payload loaded!")
    })).catch(e => console.error(e));
  }

  async getInstance(): Promise<BasePayload> {
    if (!this.#payloadInstance) {
     await this.#init(); 
    }
  
    if (!this.#payloadInstance) {
      throw new Error("Something went wrong while loading payload!")
    }

    return this.#payloadInstance
  }

}

export default new PayloadHandle();
