import axios from "axios";
import fs from "fs";
import _ from "lodash";

const camelize = (str) => _.camelCase(str);
const pascalize = (str) => _.upperFirst(camelize(str));

const generateFunction = (filename, { name, hash }) => {
  fs.appendFileSync(filename, ` let ${name} = ${hash}\n`);
};

const generateNamespace = (filename, name, namespace, jit, apiset) => {
  const natives = Object.values(namespace);

  fs.appendFileSync(filename, `module ${name} = {\n`);

  const hashKey = jit ? "jhash" : "hash";

  natives
    .filter((native) => (native.apiset ? apiset.includes(native.apiset) : true))
    .filter((native) => native.name && native[hashKey])
    .map((native) => ({
      name: camelize(native.name),
      hash: native[hashKey],
    }))
    .forEach((native) => generateFunction(filename, native));

  fs.appendFileSync(filename, "}\n");
};

const generate = (filename, natives, jit, apiset = []) => {
  const namespaces = Object.keys(natives);

  namespaces.forEach((namespace) => {
    generateNamespace(filename, pascalize(namespace), natives[namespace], jit, apiset);
  });

  fs.appendFileSync(filename, "\n");
};

async function main() {
  const cfx = (await axios.get("https://runtime.fivem.net/doc/natives_cfx.json")).data;
  const game = (await axios.get("https://runtime.fivem.net/doc/natives.json")).data;

  generate("Server.res", cfx, false, ["server", "shared"]);
  generate("Client.res", cfx, false, ["client", "shared"]);

  generate("Client.res", game, true, ["client, shared"]);
}

main();
