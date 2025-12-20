import { type BasePayload, getPayload } from 'payload';
import payloadConfig  from "../../../backend/src/payload.config.ts"


class PayloadHandle {
  #payloadInstance: BasePayload | undefined;

  constructor() {
    getPayload({ config: payloadConfig }).then((p => {
      this.#payloadInstance = p 
      console.log("Payload loaded!")
    })).catch(e => console.error(e));
  }

  getInstance() {
    if (!this.#payloadInstance) {
      throw new Error("Payload instance is not available.")
    }

    return this.#payloadInstance
  }

}

export default new PayloadHandle();
